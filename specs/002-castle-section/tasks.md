# Tasks: Nine-room castle section

**Input**: Design documents in `specs/002-castle-section/`
**Prerequisites**: spec.md, plan.md, research.md, data-model.md, contracts/gameplay.md and quickstart.md
**Organization**: One demonstrable increment per story. All implementation tasks below remain pending. [P] means disjoint work after prerequisites, not an instruction to run multiple agents.
**Tests**: No test framework requested. Required startup and targeted visible behavior checks are included per repository verification rules.

## Phase 1: Setup
- [ ] T001 Read AGENTS.md and active artifacts; verify Godot 4.7+ locally and record baseline movement/crate/fall observations in specs/002-castle-section/validation.md.

## Phase 2: Foundational
- [ ] T002 Add typed RoomDefinition in scripts/room_definition.gd: "Room IDs and grid positions are unique; every exit target and entrance exists." Enforce "Each connection joins cells with Manhattan distance exactly one and has reciprocal endpoints sharing one connection ID." Also enforce "Entrance and checkpoint spawns lie on the fixed Z lane, outside exit and hazard volumes, with supporting floor."
- [ ] T003 Add minimal GameState in scripts/game_state.gd and register in project.godot: "Fresh-session progress starts empty with has_map=false, no checkpoint and section_complete=false." Record current room/entrance, visits and observed exits from the first room; add later fields only with owning stories.

## Phase 3: US1 — Explore connected rooms (P1, MVP)
**Goal**: A/B playable round trip with crate support.
**Independent check**: Ten A–B–A round trips, jumps, crate positioning and fall recovery per quickstart.md.
- [ ] T004 [US1] Build original A/B resources with landmarks, safe entrances, platforms and useful crate ledges in rooms/poortkamer.tres and rooms/wachthal.tres.
- [ ] T005 [US1] Parameterise existing builder/camera/controls in scripts/room.gd from RoomDefinition, preserving matched collision geometry and constrained RigidBody3D crates; verify reliable push contact, adding a small typed push impulse in scripts/player.gd if needed.
- [ ] T006 [US1] Add active-room transition/rebuild controller in scripts/room_controller.gd and wire scenes/main.tscn; validate destination before teardown and prevent immediate exit retrigger. "Entry, room reset and recovery rebuild local crates, temporary switches and hazard cycle from room defaults."
- [ ] T007 [US1] Keep motion/recovery in scripts/player.gd; accept new entrance target per transition, clear momentum and handle safe fall recovery. Add R reset control in scripts/room.gd per contracts/gameplay.md.
- [ ] T008 [US1] Run headless startup and visible MVP checks; record ten round trips, lane, pushing, camera and recovery results in specs/002-castle-section/validation.md; update docs/CONTROLS.md, docs/plans/ROADMAP.md and CHANGELOG.md for this increment.

## Phase 4: US2 — Open routes and backtrack (P2)
**Goal**: One consumable-key door plus permanent shortcut loop.
**Independent check**: Key C opens E–F once; G–D–A remains available after resets. Use a temporary safe F landing resource until US4 fills its challenge.
- [ ] T009 [US2] Add pickup handling in scripts/pickup.gd: "Pickup IDs are globally unique; collected pickups cannot grant rewards twice." Add key and collected-item fields to scripts/game_state.gd, preserving acquired state across entry/reset/recovery.
- [ ] T010 [US2] Add scripts/door.gd and GameState gate operation: "Matching-key removal and connection opening are atomic and idempotent; opened connections never consume another key." Apply open status on both endpoints and after rebuild, with symbol/label feedback.
- [ ] T011 [US2] Add original connecting greyboxes in rooms/sleutelgalerij.tres, rooms/oude_trap.tres, rooms/kaartkamer.tres, rooms/archief.tres, rooms/opslagkelder.tres and a safe rooms/binnenhof.tres landing; encode only the plan.md connections among instantiated A–H, C key and E–F gate without bypasses. Defer both F–I endpoints until T020 so every active exit has a valid reciprocal target.
- [ ] T012 [US2] Implement crate-weight contact in scripts/weight_switch.gd and G–D latched shortcut; keep permanent unlock state in scripts/game_state.gd, distinct from temporary local switch state.
- [ ] T013 [US2] Add key symbol/label inventory in scripts/hud.gd and integrate pickups/doors/switches in scripts/room.gd, restoring collected/open state after rebuilds.
- [ ] T014 [US2] Run startup, key consumption/revisit checks and full shortcut loop; record results in specs/002-castle-section/validation.md and update docs/CONTROLS.md, docs/plans/ROADMAP.md and CHANGELOG.md.

## Phase 5: US3 — Discover and use the map (P3)
**Goal**: Find physical map; reveal only recorded discoveries.
**Independent check**: Prior A/B/C visits appear after pickup; no map beforehand and no unknown room contents afterward.
- [ ] T015 [US3] Add visible, optional map pickup detour in rooms/kaartkamer.tres and map grant in scripts/pickup.gd/scripts/game_state.gd; retain pre-pickup discovery and update observed door state on opening.
- [ ] T016 [US3] Implement visited-only map rendering in scripts/map_ui.gd from discovered data rather than the full registry; show current room and known border gates without unknown names/content/exits or goal/solutions.
- [ ] T017 [US3] Bind M in scripts/room.gd, gate it on map ownership and pause gameplay/hazard time while open; integrate reset/close behavior in scripts/room_controller.gd per contracts/gameplay.md.
- [ ] T018 [US3] Run startup and pre/post-map, previously observed door and unknown-room checks; record results in specs/002-castle-section/validation.md and update docs/CONTROLS.md, docs/plans/ROADMAP.md and CHANGELOG.md.

## Phase 6: US4 — Recover and finish (P4)
**Goal**: Complete nine-room route with seals, hazard and checkpoint.
**Independent check**: Finish full route; each missing-seal case blocks completion; fall/hit/reset retain progress and use correct target.
- [ ] T019 [P] [US4] Add scripts/hazard.gd with safe 2.0s, warning 1.0s, active 1.0s cycle and distinct warning shape/animation/label, and scripts/checkpoint.gd with safe contact activation.
- [ ] T020 [US4] Complete original Binnenhof challenge and safe checkpoint before hazard in rooms/binnenhof.tres; add final platform challenge and sealed expansion boundary in rooms/klokkentoren.tres and wire F–I.
- [ ] T021 [US4] Add Wachthal/Archief seal pickups and Archief momentary weight-access puzzle in rooms/wachthal.tres and rooms/archief.tres; extend scripts/game_state.gd: "Exactly two distinct seal IDs are required for section completion; seals are not consumed." Gate and latch one-time completion in scripts/door.gd/scripts/hud.gd.
- [ ] T022 [US4] Integrate checkpoint room/target recovery in scripts/player.gd and scripts/room_controller.gd; distinguish fall/hit target from current-entrance R reset and preserve permanent progress through local rebuilds.
- [ ] T023 [US4] Run startup and all quickstart.md scenarios, including no-map completion, nine-room route, missing seals, repeated overlaps and stranded crate recovery; record SC1–6 evidence in specs/002-castle-section/validation.md and update docs/GAME_DESIGN.md, docs/TECHNICAL_DESIGN.md, docs/CONTROLS.md, docs/plans/ROADMAP.md and CHANGELOG.md.

## Phase 7: Polish and cross-cutting concerns
- [ ] T024 Review stable-ID scaling and reference validation against data-model.md in scripts/room_definition.gd, scripts/game_state.gd and scripts/map_ui.gd; remove any fixed nine-room assumptions without creating additional rooms or disk-save systems.
- [ ] T025 Reconcile actual behavior, remaining visual limitations and task status across specs/002-castle-section/spec.md, plan.md, tasks.md, validation.md and docs/plans/ROADMAP.md; prepare a focused pull request into main without merging it.

## Dependencies and execution order
Setup T001 → foundation T002–3 → US1 T004–8 → US2 T009–14 → US3 T015–18 → US4 T019–23 → polish T024–25. US2 needs US1 transitions; US3 needs US2 pickups/gates; US4 integrates all prior stories. Each story is independently demonstrable after its prerequisites, with test-room greyboxes filling later challenges only when needed.

Within stories, models precede integration and verification. T009 and T012 both edit game_state.gd and run sequentially before T013; T019 may start after US1 foundations while final-room layouts are prepared. Do not parallelise edits to room.gd or game_state.gd.

## Parallel examples
- US1: no [P] tasks; builder/controller/player integration is sequential.
- US2: no [P] implementation tasks; pickup and switch script-only design drafts can be discussed independently, but their shared state edits run serially.
- US3: no [P] tasks; map grant, rendering and input integration are sequential.
- US4: T019 hazard/checkpoint scripts can proceed alongside preparation of disjoint final-room resources in T020; integrate only when both complete.

## Implementation strategy
Deliver only US1 as the first gameplay MVP. Commit each coherent task/group after its checks; then add US2, US3 and US4 as reviewable increments. Keep the current vertical slice playable between commits. Re-read spec/plan/tasks before implementation and update their status with evidence, never with assumed results.

## Requirement coverage
FR1/3 → T002,4,6,11,20; FR2 → T005,7,8; FR4/5 → T009–14,22; FR6 → T003,15–18; FR7/8 → T006–8,19–23; FR9 → T021,23; FR10 → T004,10,11,13,16,19–21; FR11 → T002,3,24. SC1–6 are exercised in T023 via quickstart.md.

25 tasks: setup 1, foundation 2, US1 5, US2 6, US3 4, US4 5, polish 2. All tasks use checkbox, sequential ID, story label when applicable and exact file paths.
