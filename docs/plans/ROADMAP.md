# Roadmap

## 1. Playable movement slice — in progress
- [x] Move left and right
- [x] Jump with gravity
- [x] Keep the player on a 2.5D lane
- [x] Push physics blocks
- [x] Recover after falling
- [ ] Tune movement and camera after hands-on play

## 2. Room puzzle slice
- [ ] Add a clear room exit and transition to a second original room
- [ ] Add a key pickup and matching locked door
- [ ] Add a room reset/checkpoint interaction
- [ ] Show a minimal inventory or key indicator

## 3. Castle exploration
- [ ] Store room connections as data rather than hard-coded geometry
- [ ] Add a simple map of visited rooms
- [ ] Add one original hazard with clear warning and reset behavior

## 4. Presentation and release
- [ ] Replace prototype primitives with original art and sound
- [ ] Add pause and settings screens
- [ ] Add export presets and a distributable desktop build

## Near-term acceptance criteria
- The player can move in both directions, jump, and recover from a fall.
- A pushable object can help reach an otherwise inaccessible ledge.
- A locked route communicates what is needed to open it.
- A room transition preserves the intended inventory and checkpoint state.