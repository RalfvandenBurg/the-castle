# Gameplay interaction contract

## Controls and feedback
- A/Left and D/Right move; Space jumps (existing controls).
- R requests current-room reset, including when stranded; M toggles map only after acquisition.
- Opening map freezes gameplay/hazard time and accepts M to close; reset requests while map is open close it before resetting. Fresh session never opens map UI.
- Pickups/checkpoints activate by contact; doors open on approach with the matching key. Exit contact transitions once after gate checks.
- Inventory shows held key symbol/label and seal count. Locked door feedback identifies the missing key; final gate identifies missing seals. No coordinate grid HUD before map ownership.

## Transition contract
Only one transition may run at a time. Player movement/recovery stays in player.gd; controller supplies safe entrance/checkpoint targets and routes rebuild requests. Target ID/spawn validation precedes destroying the source room; on failure stay safely in the source and report a diagnostic. Spawn outside triggers; ignore exits until player has safely cleared the arrival boundary. All transforms stay on the fixed lane.

## Map contract
has_map=false: map cannot open and no raster is displayed.
has_map=true: show visited rooms and current room; show observed connection states at their visited-room borders, without unknown destination names/content/exits. Full metadata cannot be read directly into visible UI. Earlier discoveries survive acquisition, reset and checkpoint recovery. Map does not show goal position or solutions.

## Hazard/checkpoint contract
Binnenhof warning cycle: safe 2.0 seconds → visible warning 1.0 second → active 1.0 second → repeat. Only active phase damages; warning has a distinct shape/animation and label. Checkpoint is on safe floor before the hazard, outside its volume. Rebuild starts safe, preventing immediate repeated death. Camera shows the warning and landing zone together.

## Persistence contract
Retain keys not yet spent, collected pickup IDs, opened routes, seals, map ownership, checkpoint, discovery and completion throughout the session. Restore local crate/switch/hazard defaults on entry/reset/recovery. Starting a new process starts fresh. No disk-save contract is introduced.
