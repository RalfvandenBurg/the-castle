# Decision 0001: Godot and a constrained 3D lane

- **Status:** Accepted
- **Decision:** Use Godot 4.7+ with 3D physics and a fixed side-on camera. Constrain movement and puzzle objects to an X/Y gameplay plane at a fixed Z depth.
- **Reason:** This gives the project real 3D physics for movable blocks while preserving readable platform-game movement.
- **Trade-off:** Camera, collisions, and depth constraints need explicit tuning; decorative depth should not affect gameplay unless intentionally introduced.