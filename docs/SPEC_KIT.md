# Spec Kit workflow

This repository has Spec Kit-compatible project artifacts. The constitution is in `.specify/memory/constitution.md`; the first feature's specification, plan, and tasks are in `specs/001-playable-movement/`.

## Codex integration status

The Spec Kit CLI and Codex skills are not installed in the local environment yet because the system drive has no free space. The repository artifacts are ready to use. Once space is available, install the Codex integration for this existing project using the official instructions:

```powershell
uv tool install specify-cli
specify integration install codex
```

Alternatively, the official existing-project initializer is `specify init --here --force --integration codex`. Commit or back up current work first, and review the generated diff before accepting it.

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
