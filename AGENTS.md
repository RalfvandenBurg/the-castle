# Instructions for coding agents

## Project context
- This is an original 2.5D puzzle-platformer prototype inspired by the room-based structure of *The Castle* (1985).
- Use Godot 4.7+ and GDScript. Keep the game playable in the current vertical slice.
- The game moves on the X/Y plane. Keep gameplay objects constrained to a fixed Z lane unless a task explicitly changes the design.
- Use original code, names, art, audio, and room layouts. Do not copy assets or exact level data from the original game.
- Read `.specify/memory/constitution.md` and the active feature's `spec.md`, `plan.md`, and `tasks.md` before implementation.

## Before changing code
- Read `README.md`, `docs/GAME_DESIGN.md`, and `docs/TECHNICAL_DESIGN.md`.
- Check the current scene and scripts before introducing a new system.
- Preserve the small, dependency-free Godot project unless a task needs a new dependency.

## Implementation rules
- Keep player movement in `scripts/player.gd`; keep current room construction and prototype controls in `scripts/room.gd`.
- Prefer typed GDScript and small functions with clear responsibilities.
- Use Godot physics bodies and collision shapes for gameplay interactions; avoid visual-only collision tricks.
- Keep generated Godot data (`.godot/`) and exported builds out of source control.
- Update the relevant spec, plan, tasks, roadmap, and changelog when player-facing behavior changes.

## Verification
- For gameplay changes, run a short headless project launch with Godot 4.7+: `godot --headless --path . --quit-after 10`.
- When changing input or fall recovery, verify both behaviors in a local game run.
- Report what was checked and any behavior that still needs a manual visual check.
