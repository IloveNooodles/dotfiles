# Agent workflow

Curated cross-harness workflow (Claude Code, Codex, OpenCode, Pi): worktree isolation → investigate → PR.
`~/.agents/skills` merges several public collections (~165 skills); this file names the handful that matter per phase, with reasons.

## The pipeline

| Phase | Skills | Why these |
|-------|--------|-----------|
| Investigate | explore subagent, `systematic-debugging`, `how`, `why` | `how` = walkthrough/placement before editing; `why` = design rationale, regressions |
| Plan | `brainstorming` → `writing-plans` (+ `architect`, `figure-it-out`) | `architect` = code-shape sketch (types/modules) before code; `figure-it-out` = auditable playbook for big migrations |
| Isolate | `worktree` (workmux), `using-git-worktrees` | Every task gets its own worktree + tmux window |
| Parallel | `coordinator`, `swarm` | `coordinator` = parallel worktree *agents*; `swarm` = in-session fan-out of N workers, one report back |
| Implement | `test-driven-development`, `incremental-implementation` (+ `arena`) | `arena` = race N candidate implementations when the approach is uncertain, graft the best parts |
| Verify | `no-mistakes`, `verification-before-completion` | Review + tests + lint gate before anything leaves the branch |
| Commit | `commit`, `rebase` | Conventional commits, clean history |
| PR | `open-pr`, `creating-pull-requests` | Draft PR from the branch diff |
| Review | `review-pr`, `code-review`, `requesting-code-review` | Self-review or others' PRs |
| Land | `merge`, `finishing-a-development-branch` (+ `reflect`) | `reflect` = distill session learnings into concrete edits after merge |

Sources: personal skills (`worktree` `workmux` `coordinator` `open-pr` `merge` `rebase` `no-mistakes`),
superpowers, wshobson/agents, addyosmani/agent-skills, mattpocock/skills (`how` `why`), pstack (`swarm` `architect` `arena` `reflect`).
Install the equivalents per harness — the phases matter more than the names.

## Pick criteria

1. Invocable per task — not background doctrine or always-on style rules
2. Maps to exactly one pipeline phase
3. Harness-portable — no Claude-only APIs

## Considered and passed

- `principle-*` (~25 skills) — background doctrine, not invocable steps; read them, don't pipeline them
- mattpocock comms aids (`bro`, `ketchup`, `wait-what`, `show-me`, `unslop`) — user-facing communication helpers, not workflow phases
- `correct` — repo-hardening meta-task; run occasionally, not per task
- `triage` — for maintaining OSS issues/external PRs
- `grilling` / `interview-me` / `loop-me` — pre-plan clarification; `brainstorming` already covers it
- `implement` / `implement-spec` — overlaps the TDD row

## Invocation per harness

- **Claude Code**: `/skill-name`; plugin skills are namespaced (`superpowers:brainstorming`)
- **Codex / OpenCode / Pi**: natural language ("use the worktree skill to …") or the harness's own skill syntax
- Skills marked `disable-model-invocation: true` (`worktree`, `open-pr`, `merge`, `rebase`, `no-mistakes`) never auto-fire — they run only when explicitly invoked, in any harness

## Single-task flow

1. Invoke `worktree` — isolated worktree + tmux window
2. Investigate: explore subagent for orientation, `how`/`why` for walkthroughs, `systematic-debugging` for bugs
3. Implement with `test-driven-development`
4. `no-mistakes` — review + tests + lint gate before anything leaves the branch
5. `commit` → `open-pr`
6. After approval: `merge`, then `reflect` when the session taught something

## Layout

- Canonical skills live in `~/.agents/skills`; per-harness dirs (e.g. `~/.claude/skills`) symlink into it
- This file is stowed from dotfiles (`stow agents`) to `~/.agents/agent-workflow.md`
- Every harness discovers it via the reference in `~/.agents/AGENTS.md` (Claude Code imports `AGENTS.md` from its `CLAUDE.md`)
- Work-specific skills stay on the work machine — never committed to public dotfiles
