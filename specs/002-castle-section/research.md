# Research and decisions

Research is grounded in AGENTS.md, the constitution, current `scripts/player.gd` and `scripts/room.gd`, technical design and the walkthrough-inspired proposal. No external engine-version or reference-game claims are needed. The required plan research review was delegated and its softlock findings incorporated.

## Room architecture
**Decision**: Keep player motion/recovery and builder responsibilities, adding a small controller and typed room resources.
**Rationale**: Current room.gd constructs one room procedurally; nine rooms need data and a transition owner, not a framework. Player currently captures spawn only in `_ready()`, so transitions must explicitly supply the new recovery target.
**Alternatives considered**: Nine duplicated scripts (maintenance drift); whole-castle physics scene (unnecessary complexity).

## Progress and recovery
**Decision**: In-memory permanent progress; crates, temporary switches and hazard cycle rebuild on entry/reset/recovery. Local reset returns to the current entrance; falls/hits return to the active checkpoint, or entrance before checkpoint activation.
**Rationale**: This prevents permanently lost crates while retaining earned progress. Needed routes latch open; the Archief switch controls only local seal access and does not trap the player.
**Alternatives considered**: Persisting every crate transform (softlocks and additional storage); resetting all progress (punishes exploration); disk saves (out of scope).

## Keys, seals and graph
**Decision**: One consumable key/door, two permanent seals and the orthogonal graph in plan.md.
**Rationale**: Atomic key consumption/opening avoids key loss. The cellar return loop passes through Oude trap because cellar and start are two grid cells apart. No H–I or C–F connection bypasses the key gate.
**Alternatives considered**: Reusable keys (less useful demonstration of inventory); direct cellar-to-start teleport (violates the chosen topology).

## Map
**Decision**: Record visits and observed exits before acquisition. After acquisition render visited cells and known door states only; unvisited cells have no names/content or exit graph. A known doorway can be drawn at a visited cell's border without disclosing the destination.
**Rationale**: Finding the map rewards earlier exploration without revealing future solutions.
**Alternatives considered**: Full castle reveal (spoilers); forgetting pre-pickup discovery (inconsistent).

## Verification boundary
**Decision**: Headless startup and visible scenario checks, without a new test framework.
**Rationale**: Current crates are RigidBody3D but player.gd has no explicit push impulse logic; reliable pushing is unverified. Startup alone cannot demonstrate reachability or safe spawn positions.
**Alternatives considered**: Treating previous spec checkmarks as proof (insufficient for this change); broad engine refactor (unnecessary).

No unresolved design questions block this plan. Defaults remain changeable through the spec before implementation.
