# RTK - Rust Token Killer

**Usage**: Token-optimized CLI proxy (60-90% savings on dev operations)

## Command rewriting

| Instead of | Use |
|------------|-----|
| `git status` | `rtk git status` |
| `git diff` | `rtk git diff` |
| `git log` | `rtk git log` |
| `git show` | `rtk git show` |
| `git branch` | `rtk git branch` |
| `git add` / `commit` / `push` / `pull` / `fetch` | `rtk git add` / `commit` / `push` / `pull` / `fetch` |
| test runners (e.g. `bundle exec rspec …`) | `rtk test bundle exec rspec …` |

Pass native git flags after the subcommand (e.g. `rtk git diff master...HEAD --stat`).

## Meta Commands (always use rtk directly)

```bash
rtk gain              # Show token savings analytics
rtk gain --history    # Show command usage history with savings
rtk discover          # Analyze Claude Code history for missed opportunities
rtk proxy <cmd>       # Execute raw command without filtering (for debugging)
```

## Installation Verification

```bash
rtk --version         # Should show: rtk X.Y.Z
rtk gain              # Should work (not "command not found")
which rtk             # Verify correct binary
```

⚠️ **Name collision**: If `rtk gain` fails, you may have reachingforthejack/rtk (Rust Type Kit) installed instead.

## Hook-Based Usage (Claude Code)

In Claude Code, Bash commands are automatically rewritten by the PreToolUse hook (`rtk hook claude`).
Example: `git status` → `rtk git status` (transparent).

Cursor and other agents do not use this hook — use explicit `rtk git` / `rtk test` per the table above.
