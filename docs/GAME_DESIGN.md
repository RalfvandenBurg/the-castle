# Game design

## High concept
An original 2.5D puzzle-platform adventure set in a connected castle. The player explores room by room, uses movement and physics to reposition objects, and solves spatial puzzles to open new routes.

## Design pillars
1. **Readable rooms:** each room presents a small set of visible objects, routes, and hazards.
2. **Physical problem solving:** blocks and other objects can change how the player reaches platforms or exits.
3. **Exploration with purpose:** keys, doors, and room connections reward learning the castle layout.
4. **Fair recovery:** falls and mistakes return the player to a clear spawn or checkpoint.

## Core loop
Explore a room → notice a blocked route or useful object → move, jump, or reposition objects → unlock or reach the exit → enter the next room.

## Reference notes
- The original *The Castle* is described as having 100 rooms, with keys for matching doors, movable puzzle objects, hazards, and a 10×10 map. In the MSX walkthrough, the player finds a map early and it starts marking rooms passed.
- Those mechanics inform broad design principles only. This project uses original room layouts, objects, art, names, and progression. Its first prototype is a 3×3 section, with 99 rooms as the current project target (the original has 100).
- Player-provided walkthrough video: https://www.youtube.com/watch?v=ZoaRf6OIHfo
- Background reference: https://en.wikipedia.org/wiki/The_Castle_(video_game)
- Detailed research and the proposed 3×3 progression: [Walkthrough-inspired game plan](plans/WALKTHROUGH_INSPIRED_PLAN.md).

Use references to understand the broad play pattern. Build new room layouts, dialogue, art, names, and level progression for this project.

## Current vertical slice
The first room demonstrates horizontal movement, jumping, a fixed 2.5D lane, physics push blocks, and respawning after a fall. It is a mechanics prototype, not a recreation of an original room.

## Open design questions
- What is the player's main goal and who or what is being rescued?
- Which objects can be pushed, lifted, or activated?
- Are keys consumed when a door opens?
- How should room transitions and checkpoints work?
