# Feature Specification: Playable 2.5D Movement

**Status:** Implemented

## User stories

### US1 — Move through the room (Priority: P1)

As a player, I can move left and right so I can explore the room and line up jumps.

**Acceptance scenarios**
1. Given the game is running, when I press A or Left Arrow, the player moves left.
2. Given the game is running, when I press D or Right Arrow, the player moves right.
3. Given the game is running, when I press Space while grounded, the player jumps.

### US2 — Interact with physics objects (Priority: P1)

As a player, I can push blocks so I can use them to reach higher platforms.

**Acceptance scenarios**
1. Given the player contacts a pushable block, when the player moves into it, the block can move under physics.
2. Given a block is pushed, it remains in the 2.5D lane.

### US3 — Recover after a fall (Priority: P1)

As a player, I can recover when I fall below the room so a mistake does not end the session.

**Acceptance scenarios**
1. Given the player falls below the configured fall limit, when the next physics frame runs, the player returns to the room spawn with velocity reset.

## Requirements

- **FR-001:** Support left and right movement with A/D and the arrow keys.
- **FR-002:** Support a grounded jump with Space and apply gravity while airborne.
- **FR-003:** Constrain the player to the configured Z lane.
- **FR-004:** Allow pushable physics blocks to move in the horizontal/vertical plane while locking depth and rotation.
- **FR-005:** Restore the player to their spawn position after they cross the fall limit.
- **FR-006:** Keep collision shapes aligned with player and platform visuals.

## Out of scope

- Enemies, keys, doors, room transitions, a full castle map, and save/load.
