# Implementation Plan: Original 3D Hero Visual

## Technical context

Godot 4.7+, GDScript, the existing `CharacterBody3D`, and the side-on fixed camera. The model uses built-in meshes and is isolated in a reusable scene/script pair.

## Design

- Keep the capsule collider separate from the visible model.
- Build the adventurer from low-poly boxes, capsules, spheres, and cylinders.
- Use rounded geometry for the torso and original small travel gear, with empty hands.
- Use original colors and proportions: green clothing and cap, warm hair and skin, and leather boots and belt.
- Keep facial features legible in the side-on camera and shape the cap as a fitted crown with a modest forward point.
- Add a 13-bone hierarchy and attach low-poly parts to bone attachments, keeping the collider separate.
- Drive procedural walk and run cycles from horizontal speed. Use measured acceleration and deceleration, and hold Shift to run.
- Rotate only the visual root to face horizontal movement; leave physics and the fixed Z lane unchanged.

## Verification notes

- Check Godot headless startup and review the character and walk/run movement in a visible local run.
- Confirm left/right movement still works and the full silhouette remains visible.
- Visible review and headless startup checks are pending.
