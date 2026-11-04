# Implementation Plan: Playable 2.5D Movement

## Technical context
Godot 4.7+, GDScript, a fixed side-on camera, and built-in 3D physics. The current prototype builds its room procedurally in `scripts/room.gd`; player motion and fall recovery live in `scripts/player.gd`.

## Design
- Bind A/Left and D/Right as physical keyboard actions at room startup.
- Use `CharacterBody3D` with horizontal acceleration, gravity, and a grounded jump.
- Lock player depth to the configured Z lane.
- Use `RigidBody3D` blocks with depth translation and rotation locked.
- Record the player's initial position as the spawn and restore it below the fall limit.
- Keep the camera and collision geometry in the room scene builder.

## Verification
- Run the project headlessly for ten frames.
- Inject Left Arrow input in a short smoke run and confirm horizontal displacement.
- Move the player below the fall limit and confirm it returns to spawn.
