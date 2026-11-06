# Spec Kit workflow

This repository has Spec Kit-compatible project artifacts. The constitution is in `.specify/memory/constitution.md`; the first feature's specification, plan, and tasks are in `specs/001-playable-movement/`.

## Codex integration status

This branch contains the Codex Spec Kit skills in `.agents/skills/speckit-*` and the PowerShell setup/template scripts in `.specify/scripts/powershell/`. The repository integration is present; a compatible local PowerShell runtime is needed to run these scripts. Godot remains the only gameplay runtime dependency.

The active planned feature is [002-castle-section](../specs/002-castle-section/spec.md). The Git branch is `codex/100-room-plan`; feature directory names are independent of branch names. In another checkout, select this feature with the ignored local pointer before running plan/tasks:

```powershell
'{"feature_directory":"specs/002-castle-section"}' | Set-Content .specify/feature.json
```

The specification, plan/design artifacts and tasks were authored using the checked-in skill workflow and resolver/setup scripts. This does not imply that gameplay implementation or Godot checks have run. See the feature's [validation guide](../specs/002-castle-section/quickstart.md).

Official integration setup remains available if refreshing the integration: https://github.github.io/spec-kit/integrations/codex.html. Commit current work and review generated changes before refreshing.

## Workflow

Once the Codex skills are installed, run them one at a time for each bounded feature:

1. `$speckit-specify` — define user stories, requirements, and acceptance criteria.
2. `$speckit-clarify` — resolve meaningful open questions.
3. `$speckit-plan` — choose the technical approach.
4. `$speckit-tasks` — create ordered implementation tasks.
5. `$speckit-analyze` — check consistency between artifacts.
6. `$speckit-implement` — implement the feature.
7. `$speckit-converge` — verify the implementation against the spec.

Official setup: https://github.github.io/spec-kit/integrations/codex.html and https://github.github.io/spec-kit/guides/existing-projects.html.
