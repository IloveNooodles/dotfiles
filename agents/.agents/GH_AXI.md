# GitHub CLI Proxy

Use `gh-axi` instead of `gh` for all GitHub CLI operations. Details live here; the always-on rule and command table live in [AGENTS.md](AGENTS.md).

## Rule

Never invoke `gh` directly when `gh-axi` supports the command:

```bash
gh-axi pr view 12863
gh-axi pr checks 12863
gh-axi api repos/OWNER/REPO/pulls/NUMBER/comments
```

| Instead of | Use |
|------------|-----|
| `gh pr list` | `gh-axi pr list` |
| `gh pr view <n>` | `gh-axi pr view <n>` |
| `gh pr create` | `gh-axi pr create` |
| `gh pr edit <n>` | `gh-axi pr edit <n>` |
| `gh pr diff <n>` | `gh-axi pr diff <n>` |
| `gh pr checks <n>` | `gh-axi pr checks <n>` |
| `gh issue …` | `gh-axi issue …` |
| `gh api …` | `gh-axi api …` |

## Supported Commands

`gh-axi` supports these command groups:

```text
dashboard, issue, pr, run, workflow, release, repo, label, search, api, setup
```

Use `--body-file` / `--repo` like `gh`. Add `--full` on `pr view` or `pr diff` when output is truncated.
Use `gh-axi --help` or the relevant subcommand help when syntax is uncertain.

Do not silently fall back to `gh`. If `gh-axi` cannot perform a required operation, explain the limitation and request explicit approval before using another GitHub client.

## Verification

```bash
gh-axi --version
```

## Codex

Codex's shell may not expose `node` through `PATH`, so Codex uses its own variant with absolute paths: `~/.codex/GH_AXI.md`.
