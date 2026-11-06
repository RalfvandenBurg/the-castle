# Changelog

## Unreleased
- Fixed a cone mesh builder parameter mismatch that prevented the rigged character visual from loading.
- Applied the skeleton's rest pose on initialization so attached model parts appear at their intended joints.
- Turned the full player model toward the current horizontal travel direction and aligned the limb swing and sword angle to the side view.
- Replaced the moving capsule placeholder with an original 3D adventurer in a green tunic, pointed cap, sword, and shield; the visual turns with movement.
- Rounded the tunic and shield and rebuilt the sword around the hand so the hilt, blade, and pointed tip read as one held weapon.
- Added a 13-bone skeleton rig, attached the character parts and equipment to its joints, and added a simple procedural walk cycle.
- Added keyboard movement, jumping, physics push blocks, and fall recovery to the first 2.5D room.
- Added project, architecture, design, and roadmap documentation.
