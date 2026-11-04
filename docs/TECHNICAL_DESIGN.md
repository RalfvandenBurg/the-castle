# Technical design

## Engine and language
- Godot 4.7+
- GDScript
- 3D renderer with a fixed side-on camera for a 2.5D presentation

## Coordinate and physics model
- X: horizontal movement
- Y: vertical movement and gravity
- Z: fixed gameplay lane
- Player: `CharacterBody3D` with explicit acceleration, jump velocity, and fall recovery.
- Pushable puzzle objects: `RigidBody3D` with Z translation and rotation constrained.
- Floors and platforms: `StaticBody3D` with matching collision and visual geometry.

## Current project layout
- `scenes/main.tscn`: main scene entry point.
- `scripts/room.gd`: builds the current prototype room, camera, input map, platforms, push blocks, and player.
- `scripts/player.gd`: player movement, jumping, plane constraint, and fall recovery.

## Planned scene evolution
As the prototype grows, move room geometry to reusable scenes, add a room-transition/controller layer, and keep player, puzzle objects, doors, and UI as separate systems. Add new abstractions only when multiple rooms need them.

## Verification
Run `godot --headless --path . --quit-after 10` to confirm the main scene can load and initialize. Input and physics behavior should also be checked in a visible local run.