# Feature Specification: Nine-room castle section

**Feature Branch**: `codex/100-room-plan`
**Created**: 2026-11-04
**Status**: Ready for planning; gameplay not implemented
**Input**: Specify, plan and break down the original 3×3 section from `docs/plans/WALKTHROUGH_INSPIRED_PLAN.md`, as the first increment toward 100 rooms.

## User Scenarios & Testing

### User Story 1 - Explore connected rooms (Priority: P1)
As a player, I move, jump and push crates between recognisable rooms and return through the exit I used.

**Why this priority**: A two-room round trip is the smallest useful exploration increment.
**Independent Test**: Travel Poortkamer → Wachthal → Poortkamer with movement, jumping and crate interaction available throughout.

**Acceptance Scenarios**:
1. **Given** a new session, **When** play begins, **Then** I start safely in Poortkamer without a map screen or grid HUD.
2. **Given** an available exit, **When** I enter it, **Then** I arrive inside the destination at its matching entrance, retain control and can return without immediately bouncing between rooms.
3. **Given** a crate puzzle, **When** I reposition the crate, **Then** it supports a jump while player and crate remain on the same gameplay plane.

### User Story 2 - Open routes and backtrack (Priority: P2)
As a player, I collect a key, recognise its matching lock, open a route and unlock a shortcut back to earlier rooms.

**Why this priority**: Locks and revisiting turn separate rooms into an exploration puzzle.
**Independent Test**: Collect the key in Sleutelgalerij, open the Kaartkamer–Binnenhof door, revisit it and activate the Opslagkelder shortcut.

**Acceptance Scenarios**:
1. **Given** a locked door without its key, **When** I approach, **Then** it stays closed and communicates its matching key with a symbol and label, not colour alone.
2. **Given** the matching key, **When** I open its door, **Then** exactly one key is consumed, inventory updates and both sides stay open for this session, including after recovery.
3. **Given** a crate on the Opslagkelder switch, **When** it activates, **Then** the shortcut to Oude trap stays open even if the crate moves or resets, allowing a return to Poortkamer.

### User Story 3 - Discover and use the map (Priority: P3)
As a player, I find a physical map in Kaartkamer and orient myself without seeing unexplored solutions.

**Why this priority**: Navigation follows the basic exploration and lock loop.
**Independent Test**: Explore two rooms before collecting the map, then inspect it.

**Acceptance Scenarios**:
1. **Given** no map pickup, **When** I use the map control, **Then** no map or grid opens.
2. **Given** the map pickup, **When** collected, **Then** the map becomes available and includes previously visited rooms, current position and previously observed connections/blockades.
3. **Given** an unvisited room, **When** I inspect the map, **Then** its contents, name and exits remain hidden; no goals or puzzle solutions are revealed.
4. **Given** an observed locked door, **When** it opens, **Then** its known map state becomes open.

### User Story 4 - Recover and finish (Priority: P4)
As a player, I learn one warned hazard, recover reliably, combine earlier rules and finish the nine-room section.

**Why this priority**: Complete the route after its exploration tools are stable.
**Independent Test**: Activate the Binnenhof checkpoint, fail the hazard, recover, collect both seals and finish Klokkentoren.

**Acceptance Scenarios**:
1. **Given** a fall or hazard hit, **When** recovery occurs, **Then** I return to the active checkpoint, or current entrance before activation, with no momentum and outside hazards and exit triggers.
2. **Given** a displaced crate, **When** I use room reset, **Then** current-room crates and temporary switches restore and I return to that room's entrance; permanent progress and checkpoint remain.
3. **Given** the hazard, **When** I watch it, **Then** a visible warning always precedes its active interval and the cycle repeats predictably.
4. **Given** both seals, **When** I solve the final platform challenge and reach the goal, **Then** completion is shown once; the expansion door remains a closed boundary.

### Edge Cases
- Repeated pickup, door or goal overlap cannot duplicate rewards, consume another key or repeat completion.
- Arriving while holding movement cannot cause immediate return; entrances are outside exit volumes.
- Crates blocking routes remain recoverable with room reset.
- A used key never respawns and its opened door never demands it again.
- Checkpoint recovery does not resurrect collected items or erase discovery.
- Unknown rooms do not leak through map names or exits; observed blocked doors are known before crossing them.

## Requirements

### Functional Requirements
- **FR-001**: Provide the nine original rooms and roles in the walkthrough-inspired plan at unique 3×3 positions, starting in Poortkamer and ending in Klokkentoren.
- **FR-002**: Preserve left/right movement, jumping, pushing and fixed-plane play; introduce each rule safely before combining it.
- **FR-003**: Support orthogonal exits, safe entrance spawning, round trips and an unlockable Opslagkelder → Oude trap → Poortkamer return route, without diagonal or two-cell teleports.
- **FR-004**: Place one identifiable key in Sleutelgalerij and its matching lock between Kaartkamer and Binnenhof; consume the key once and retain the open route.
- **FR-005**: Retain inventory, collected pickups/seals, map ownership, opened routes, checkpoint and discoveries across room changes, falls and room reset in a running session.
- **FR-006**: Start without map UI; the physical Kaartkamer pickup unlocks it for the session. Show only visited rooms, current position and observed connections/blockades, including discoveries made before pickup.
- **FR-007**: Provide one repeatable warned hazard and one safe checkpoint in Binnenhof. Recovery clears momentum and never spawns inside a hazard or exit.
- **FR-008**: Allow room reset throughout play, restoring local crates and temporary switches without undoing permanent progress. Room entry and recovery also restore the destination's local puzzle layout.
- **FR-009**: Place permanent seals in Wachthal and Archief. Archief combines a crate-weight switch with reaching its seal; Klokkentoren requires both seals and a platform challenge for completion.
- **FR-010**: Provide nine distinct landmarks, readable platforms/exits, symbol/label key and lock feedback, minimal inventory and clear completion feedback without puzzle answers.
- **FR-011**: Identify progress independently of the nine-room count, allowing later expansion toward 100 rooms.

### Key Entities
- **Room**: Identity, grid position, entrances, exits, landmark and local puzzle objects.
- **Connection**: Neighbouring rooms, observed status and optional permanent gate.
- **Progress**: Key, collected pickups/seals, map ownership, discovery, opened routes, checkpoint and completion.
- **Local puzzle**: Resettable crates, switches and hazard cycle, distinct from permanent progress.

## Success Criteria

### Measurable Outcomes
- **SC-001**: A new-session playthrough reaches all nine rooms and completes Klokkentoren without a walkthrough document or unrecoverable state.
- **SC-002**: Ten consecutive two-room round trips retain control and land safely without transition loops.
- **SC-003**: Before map pickup zero map screens/grid HUDs appear; afterward every visited room and observed connection is represented, with zero unvisited contents revealed.
- **SC-004**: Fall, hazard hit, reset and re-entry each preserve all permanent progress and restore the documented local state.
- **SC-005**: The key opens only its matching door exactly once, stays unnecessary on revisits and both seals are required at completion.
- **SC-006**: The section contains one functioning return loop, one crate-weight puzzle, one warned hazard, one checkpoint and nine landmarks.

## Assumptions
- Room names and roles are working names for original layouts. Rows increase downward; explicit grid positions supersede ambiguous directional prose in the earlier proposal.
- The single key is consumable; both seals are permanent and not consumed.
- Crates and temporary switches reset on entry/reset/recovery; permanent routes latch open.
- Progress lasts only for the running session. Disk saves, enemies, rescue narrative, final art, export packaging and the remaining 91 rooms are outside scope.
- Existing movement is a starting point; hands-on tuning and reliable crate pushing remain implementation checks.
