# Feature Specification: Original 3D Hero Visual

**Status:** Implemented; visual review pending

## User story

As a player, I want a recognizable fantasy adventurer instead of a plain moving capsule, so the character feels like the hero of a puzzle-platform game.

## Requirements

- **FR-001:** Keep the existing `CharacterBody3D` movement and physics behavior.
- **FR-002:** Replace the capsule rendering with a reusable 3D visual scene while keeping a separate collision shape.
- **FR-003:** Give the hero a readable original silhouette with a green outfit, pointed cap, hair, face, and small travel gear; do not equip weapons or a shield.
- **FR-004:** Turn the full character to face left or right with horizontal movement without changing the movement plane.
- **FR-005:** Use built-in Godot meshes and materials; do not add external asset dependencies.
- **FR-006:** Ensure the collision capsule covers the visible character's body closely enough for normal platforming.
- **FR-007:** Use rounded forms for the main tunic to avoid a block-only silhouette.
- **FR-009:** Provide a named `Skeleton3D` hierarchy for pelvis, spine, neck, head, arms, hands, legs, and feet.
- **FR-010:** Animate opposing arm and leg swings procedurally, with a quicker, wider gait at run speed.

## Acceptance scenarios

1. The game displays a complete 3D adventurer in place of the capsule.
2. The character remains centered on the fixed Z gameplay lane and uses the existing movement controls.
3. Moving left and right flips the character visual to face the travel direction.
4. The model is separate from its physics collider and can be reused by another scene.
5. The Skeleton3D exposes named joints, and the limbs move through walk and run cycles without moving the physics body off its gameplay lane.

## Out of scope

- Exact recreation of Link or any other copyrighted character.
- Imported, rigged, or animated character assets.
- Combat and weapon interactions.
