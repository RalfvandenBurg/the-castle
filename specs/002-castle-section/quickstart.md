# Validation guide

## Prerequisites and feature selection
Use Godot 4.7+ and a visible desktop run for physics/navigation checks. The planning authoring environment has no Godot; none of these gameplay checks have been run for this feature.

Checkout `codex/100-room-plan`. In PowerShell at repository root, select the feature (this file is local and ignored):

```powershell
'{"feature_directory":"specs/002-castle-section"}' | Set-Content .specify/feature.json
.specify/scripts/powershell/check-prerequisites.ps1 -Json -RequireTasks -IncludeTasks
```

After each gameplay increment run:

```text
godot --headless --path . --quit-after 10
```

Open project.godot and F5 for the checks below. Record version, machine, scenario result and remaining manual issues in this feature's validation notes during implementation. They are future acceptance checks, not current passing claims.

## US1: two-room MVP
New session at A: test both directions, jumping, crate pushing/support, falls and camera. Cross A–B and back ten times; hold movement on arrival. No bounce, lost input, wrong lane or unsafe entrance. Verify contact actually moves crates; add physics push handling if required.

## US2: key and backtracking
Try E–F without a key; read symbol/label. Collect key at C, return and open E–F; exactly one key disappears. Revisit both sides, fall and reset: door remains open, pickup absent. Reach G through E–H–G; push crate onto shortcut switch; move/reset it; G–D stays open and G–D–A returns to the start. No alternative C–F or H–I bypass exists.

## US3: map
Explore A/B/C before pickup and press M: no map. Collect map at E and open it: all prior visits appear, unknown cells reveal no contents/names/exits. Observe a locked door, open it and inspect map state. M freezes gameplay/hazard timing while open and resumes on close; no progression is lost after reset/recovery. Repeat with map deliberately uncollected and confirm route remains completable.

## US4: recovery and complete route
Follow A–B–C–B–E–H–G–D–A–B–E–F–I, taking both seals and optionally map. Confirm nine landmarks and local puzzles (Archief weight switch; final platform challenge). Try goal with each seal missing and then both present. Completion occurs once and expansion boundary stays closed.

Activate F checkpoint before hazard. Observe safe/warning/active phases against the contract, then take a hit and fall elsewhere: return safely to F without momentum. R returns to current room entrance rather than F, resets crates/switches, and retains checkpoint plus permanent progress. Fall before any checkpoint returns to current entrance. Test a crate pushed off a platform, repeated pickup/door overlap and arrival while holding movement.

## Completion record
SC1–6 in spec.md require recorded visible results; headless startup alone is insufficient. Update tasks, ROADMAP, CHANGELOG and changed design docs per implementation increment, retaining any unresolved visual checks.
