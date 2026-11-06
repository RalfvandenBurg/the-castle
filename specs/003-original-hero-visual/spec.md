# Feature Specification: Original 3D Hero Visual

**Status:** Implemented; visual review pending

## User story

As a player, I want a recognizable fantasy adventurer instead of a plain moving capsule, so the character feels like the hero of a puzzle-platform game.

## Requirements

- **FR-001:** Keep the existing `CharacterBody3D` movement and physics behavior.
- **FR-002:** Replace the capsule rendering with a reusable 3D visual scene while keeping a separate collision shape.
- **FR-003:** Give the hero a readable original silhouette with a green outfit, pointed cap, hair, face, sword, and rounded shield.
- **FR-004:** Turn the visual left or right with horizontal movement without changing the movement plane.
- **FR-005:** Use built-in Godot meshes and materials; do not add external asset dependencies.
- **FR-006:** Ensure the collision capsule covers the visible character's body closely enough for normal platforming.
- **FR-007:** Keep the sword hilt and blade aligned at the hand so they read as one held object.
- **FR-008:** Use rounded forms for the main tunic and shield to avoid a block-only silhouette.
- **FR-009:** Provide a named `Skeleton3D` hierarchy for pelvis, spine, neck, head, arms, hands, legs, and feet.
- **FR-010:** Attach the shield and sword to the hand bones and swing limbs in a procedural walk cycle while moving.

## Acceptance scenarios

1. The game displays a complete 3D adventurer in place of the capsule.
2. The character remains centered on the fixed Z gameplay lane and uses the existing movement controls.
3. Moving left and right flips the character visual to face the travel direction.
4. The model is separate from its physics collider and can be reused by another scene.
5. The sword visibly meets the hand and its guard, blade, and pointed tip form one continuous shape.
6. The Skeleton3D exposes named joints, and the limbs move with a walk cycle without moving the physics body off its gameplay lane.

## Out of scope

- Exact recreation of Link or any other copyrighted character.
- Imported, rigged, or animated character assets.
- Combat and sword/shield interactions.
