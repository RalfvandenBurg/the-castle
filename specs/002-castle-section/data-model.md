# Data model

This describes planned Resources and in-memory state, not an implemented API. Identifiers use StringName; coordinates use Vector2i. Collections are keyed by stable IDs rather than nine-element arrays. Logical rows/columns in documentation are 1-based.

## RoomDefinition — scripts/room_definition.gd; rooms/*.tres
Fields: id, grid_position, landmark, entrance transforms, exit definitions, platform/crate specifications, pickup specifications, optional hazard/checkpoint.
Constraint R1: "Room IDs and grid positions are unique; every exit target and entrance exists."
Constraint R2: "Each connection joins cells with Manhattan distance exactly one and has reciprocal endpoints sharing one connection ID."
Constraint R3: "Entrance and checkpoint spawns lie on the fixed Z lane, outside exit and hazard volumes, with supporting floor."
All nine positions and connections are defined in plan.md; layouts are original. Geometry/collision sizes agree.

## SessionProgress — scripts/game_state.gd
Fields: current_room_id, current_entrance_id, inventory_key_ids, collected_pickup_ids, opened_connection_ids, seal_ids, visited_room_ids, observed_connection_ids/status, has_map, checkpoint (optional room_id + spawn_id), section_complete.
Constraint P1: "Pickup IDs are globally unique; collected pickups cannot grant rewards twice."
Constraint P2: "Matching-key removal and connection opening are atomic and idempotent; opened connections never consume another key."
Constraint P3: "Exactly two distinct seal IDs are required for section completion; seals are not consumed."
Constraint P4: "Fresh-session progress starts empty with has_map=false, no checkpoint and section_complete=false."
Update current room/entrance only after successful entry, transition or recovery. Mark visits on entry and observed exits when visible in the active room, even without a map. Map views are derived from discovery, not the complete room registry.

## LocalRoomState — room builder/controller
Fields: active instance, crate bodies, temporary switch states, hazard phase, entrance recovery transform, transition-in-flight flag.
Constraint L1: "Entry, room reset and recovery rebuild local crates, temporary switches and hazard cycle from room defaults."
Permanent unlocks are reapplied after rebuilding; collected pickups remain absent. A shortcut activation latches the connection in SessionProgress. The Archief weight switch remains temporary, controls seal access only and cannot block leaving/resetting.

## Transitions
- New session: clear progress; enter A at start; mark A visited.
- Exit: reject locked/unavailable/invalid targets; guard overlapping transitions; rebuild target; reapply progress; set current entrance; clear player momentum; release guard only after safe separation from exits.
- Key door: validate match → record open and remove key in one operation → update collision/feedback/discovered status.
- Pickup: if uncollected, mark collected and grant key/seal/map once.
- Room reset: rebuild current room; return to current entrance; preserve checkpoint and permanent progress.
- Fall/hit: rebuild checkpoint room if active, otherwise current room; set current_room_id to the recovery room and current_entrance_id to its designated safe entrance; spawn at the checkpoint target when active. Subsequent R reset uses that room entrance, not a stale prior room. Clear momentum and preserve progress.
- Goal: require two seals; latch completion once; future expansion remains inaccessible.
