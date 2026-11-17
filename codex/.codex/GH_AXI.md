# GitHub CLI Proxy (Codex)

Use `gh-axi` instead of `gh` for all GitHub CLI operations.

## Rule

Never invoke `gh` directly. Use this exact command prefix:

```bash
/opt/homebrew/bin/rtk ~/.local/share/mise/shims/gh-axi
```

The explicit Node path is required because the Codex shell may not expose `node` through `PATH`.

## Examples

```bash
/opt/homebrew/bin/rtk ~/.local/share/mise/shims/gh-axi pr view 12863
/opt/homebrew/bin/rtk ~/.local/share/mise/shims/gh-axi pr checks 12863
/opt/homebrew/bin/rtk ~/.local/share/mise/shims/gh-axi api repos/OWNER/REPO/pulls/NUMBER/comments
```

## Supported Commands

`gh-axi` supports these command groups:

```text
dashboard, issue, pr, run, workflow, release, repo, label, search, api, setup
```

Use `gh-axi --help` or the relevant subcommand help when syntax is uncertain. Preserve normal `gh` arguments and flags when `gh-axi` supports them.

Do not silently fall back to `gh`. If `gh-axi` cannot perform a required operation, explain the limitation and request explicit approval before using another GitHub client.

## Verification

```bash
/opt/homebrew/bin/rtk ~/.local/share/mise/shims/gh-axi --version
```
