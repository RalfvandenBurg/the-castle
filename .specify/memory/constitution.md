# Project constitution

## 1. Original work
Create original code, names, level layouts, art, and audio. Use *The Castle* and the supplied walkthrough only to understand broad mechanics and pacing; do not copy original assets or exact rooms.

## 2. Playable, readable rooms
Every room must communicate its platforms, exits, hazards, and useful objects clearly. Prefer a small playable slice over systems that have no current gameplay use.

## 3. Consistent 2.5D physics
The default play plane is X/Y with a fixed Z lane. Player and puzzle-object collisions must agree with their visible geometry. Depth should not change gameplay unless the feature spec calls for it.

## 4. Predictable recovery
A fall or reset must lead to a clear spawn or checkpoint. Do not leave the player trapped or permanently outside the playable area.

## 5. Small, documented changes
Keep GDScript typed and responsibilities clear. Update the active spec, plan, tasks, roadmap, and changelog when the player-visible design changes.

## 6. Verification
Gameplay changes require a Godot headless startup check and a targeted behavior check for the changed interaction. Report manual visual checks separately.

## 7. Minimal dependencies
Use built-in Godot features unless a specific requirement justifies an added dependency.
