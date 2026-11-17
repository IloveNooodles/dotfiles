# Global agent instructions

Canonical cross-tool defaults. Project repos may add their own `AGENTS.md` or `.cursor/rules/` on top.

Loaded on demand, follow only when needed: [RTK.md](RTK.md) (rtk command table, meta commands, install checks, hook behavior), [GH_AXI.md](GH_AXI.md) (gh-axi command table, flags, fallback policy), [agent-workflow.md](agent-workflow.md) (worktree → investigate → PR workflow, curated skill list).

## Shell — RTK (`rtk`)

Prefix shell commands with `rtk`: `rtk git status`, `rtk git diff`, `rtk test bundle exec rspec …`. Pass native flags after the subcommand.
Use plain `git` only when rtk lacks the subcommand or full uncompressed output is required.
In Claude Code a hook rewrites commands automatically; explicit `rtk` is required in Cursor and other harnesses.

## GitHub — `gh-axi` (not `gh`)

`gh-axi` for every GitHub operation it supports: `gh-axi pr view 12863`, `gh-axi issue list`, `gh-axi api …`.
Never silently fall back to `gh` — if `gh-axi` lacks the operation, explain the limitation and ask first.

## Browser automation

Use `chrome-devtools-axi` instead of raw browser MCP when automating the browser.

## Ponytail (lazy senior dev)

Prefer the smallest correct change: YAGNI, reuse existing code/patterns, no new abstractions or dependencies unless asked, deletion over addition. Trace the real flow before coding; fix root causes at shared call sites. Mark intentional shortcuts with a `ponytail:` comment (ceiling + upgrade path).
