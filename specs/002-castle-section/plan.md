# Implementation Plan: Nine-room castle section

**Branch**: `codex/100-room-plan` | **Date**: 2026-11-04 | **Spec**: [spec.md](spec.md)
**Input**: `specs/002-castle-section/spec.md`

## Summary
Deliver a two-room exploration MVP, then locks and backtracking, a found map, and finally the complete original nine-room greybox. Preserve the current prototype while extracting only the systems that multiple rooms require. No gameplay is implemented by this planning change.

## Technical Context
**Language/Version**: Typed GDScript, Godot 4.7+ as required by the repository.
**Primary Dependencies**: Built-in Godot 3D physics, Resources, signals and UI only.
**Storage**: Small in-memory GameState autoload; no disk save.
**Testing**: Required headless launch plus targeted visible checks in [quickstart.md](quickstart.md); no new test framework.
**Target Platform**: Desktop keyboard prototype.
**Project Type**: Single Godot game project.
**Performance Goals**: One active room; target responsive 60 fps on the playtest machine, record machine and observations rather than claim an unmeasured guarantee.
**Constraints**: Fixed Z lane, matching visual/collision geometry, original assets/layouts, no imported framework.
**Scale/Scope**: Nine rooms now; stable identities suitable for 100 later. Future saves are not included.

## Constitution Check
Before research and after design: all seven gates pass for this design.
1. Original work: new graph, greybox layouts and hazard; no copied level data.
2. Playable/readable: each story produces a demonstrable increment; landmarks and readable gates required.
3. Physics: preserve X/Y lane and built-in bodies/collision shapes.
4. Recovery: explicit entrance/checkpoint/reset contracts, with transient objects restored.
5. Small documented changes: commit one coherent increment at a time, update active artifacts/roadmap/changelog for behavior changes.
6. Verification: headless and targeted visible validation at each gameplay increment; no claim that planning verifies gameplay.
7. Dependencies: Godot built-ins only. Temporary authoring PowerShell is not a game dependency.

## Project Structure
Documentation: `specs/002-castle-section/` contains spec, plan, research, data-model, quickstart, tasks, quality checklist and `contracts/gameplay.md`.

Planned source paths (do not create systems until their story needs them):
- `scenes/main.tscn`: existing entry; attach small room controller when two rooms work.
- `scripts/player.gd`: keep movement and recovery here; add entrance/checkpoint target handoff and clear velocity on recovery.
- `scripts/room.gd`: retain room construction, camera and prototype controls; accept a definition instead of hard-coded single-room geometry.
- `scripts/room_definition.gd`, `rooms/*.tres`: typed resource definitions for platforms, crates, entrances, pickups and orthogonal connections.
- `scripts/room_controller.gd`: one active room, transition guard, target selection and local rebuilds.
- `scripts/game_state.gd`, `project.godot`: minimal autoload, permanent session state and feature input actions.
- `scripts/pickup.gd`, `scripts/door.gd`, `scripts/weight_switch.gd`: reusable interactions as needed by US2/US4.
- `scripts/map_ui.gd`, `scripts/hud.gd`: discovered-only map and minimal inventory/feedback.
- `scripts/hazard.gd`, `scripts/checkpoint.gd`: US4 recovery interactions.

**Structure Decision**: Keep the existing builder and player, add a controller only for multiple rooms, use one active resource-driven room. Details and validation constraints are in [data-model.md](data-model.md).

## Original room graph
Rows increase downward and columns rightward. Grid adjacency is navigation topology; vertical neighbours use clearly marked exits, not depth movement. Letters below are documentation aliases, not unstable runtime identifiers.

| Alias / stable ID | Grid | Role |
| --- | --- | --- |
| A / poortkamer | 1,1 | Start, safe movement and low crate ledge |
| B / wachthal | 1,2 | Higher crate ledge, bronze seal |
| C / sleutelgalerij | 1,3 | Short platform detour, key pickup |
| D / oude_trap | 2,1 | Height changes, safe recovery lesson |
| E / kaartkamer | 2,2 | Visible map on a short detour, central hub |
| F / binnenhof | 2,3 | Keyed approach, safe checkpoint before warned hazard |
| G / opslagkelder | 3,1 | Crate switch latches shortcut to D |
| H / archief | 3,2 | Momentary crate-weight platform access to second seal |
| I / klokkentoren | 3,3 | Platform challenge and both-seal completion gate |

Bidirectional connections: A–B, B–C, A–D, D–E, B–E, E–H, H–G, G–D, E–F, F–I. G–D initially blocked and permanently opened from the switch in G; E–F consumes the key from C. All other listed connections are free; absent adjacencies remain walls. No C–F or H–I bypass. The final gate is inside I, not another map connection.

A valid route is A–B (seal)–C (key)–B–E (map)–H (seal)–G (shortcut)–D–A–B–E–F (key door, checkpoint)–I (finish). The map is optional to collect and never a progression gate. This route visits all nine rooms and demonstrates the return loop.

## Delivery and verification
1. US1: tune existing movement/crate contact, build A/B and round-trip transitions.
2. US2: add session state, C/D/E/H/G greyboxes sufficient for key and shortcut route; defer their map/seal puzzles to owning stories.
3. US3: add map pickup and discovered-only UI; record discovery from the first room onward.
4. US4: add F/I, seals, Archief puzzle, hazard/checkpoint and final gate, then all-nine-room playthrough.

Headless startup is necessary but does not prove pushing, jump reachability, warning readability or route solvability. Record those from a visible run. Before each implementation increment read this feature's spec/plan/tasks and AGENTS.md.

## Authoring workflow notes
Spec Kit 1.3.0 repository skills and PowerShell resolver/setup scripts are used. There are no extension hooks or template overrides in this checkout. `.specify/feature.json` selects this feature locally and is deliberately ignored by Git. Setup scripts report `002-castle-section` as their feature name; the actual Git branch remains the user-requested `codex/100-room-plan`. See [quickstart.md](quickstart.md) to select this feature in another checkout.
