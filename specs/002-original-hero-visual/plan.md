# Implementation Plan: Original 3D Hero Visual

## Technical context

Godot 4.7+, GDScript, the existing `CharacterBody3D`, and the side-on fixed camera. The model uses built-in meshes and is isolated in a reusable scene/script pair.

## Design

- Keep the capsule collider separate from the visible model.
- Build the adventurer from low-poly boxes, capsules, spheres, and cylinders.
- Use original colors and proportions: green clothing and cap, warm hair and skin, leather boots, a blue shield, and a steel sword.
- Flip only the visual root on horizontal movement; leave physics and the fixed Z lane unchanged.

## Verification notes

- Check Godot headless startup and review the character in a visible local run.
- Confirm left/right movement still works and the full silhouette remains visible.
- These checks are pending; no tests were run as part of this change.
