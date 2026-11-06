# The Castle 2.5D

An original 2.5D puzzle-platformer prototype inspired by the room-based structure of *The Castle*. It uses placeholder geometry and contains no art or level data from the 1985 game.

## Run

1. Open `project.godot` in Godot 4.7 or newer.
2. Press F5 to run the first room.

## Controls

- **A / Left Arrow:** move left
- **D / Right Arrow:** move right
- **Space:** jump

Physics push blocks are in the first room. Falling below it returns the player to the start position.

## Project map

- `AGENTS.md` — instructions for coding agents
- `docs/GAME_DESIGN.md` — game concept and references
- `docs/TECHNICAL_DESIGN.md` — engine, physics, and scene architecture
- `scenes/hero_visual.tscn` — reusable low-poly adventurer model
- `docs/plans/ROADMAP.md` — milestones and acceptance criteria
- `docs/SPEC_KIT.md` — Spec Kit workflow
- `.specify/memory/constitution.md` — project principles
- `specs/001-playable-movement/` — first feature specification, plan, and tasks
- `specs/002-castle-section/` — planned original 3×3 section: specification, design, tasks and validation guide
- `CONTRIBUTING.md` — workflow and content guidelines
- `CHANGELOG.md` — player-facing changes

## License

Code is available under the MIT License. No original game assets are included.
