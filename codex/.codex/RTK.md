# RTK - Rust Token Killer (Codex CLI)

**Usage**: Token-optimized CLI proxy for shell commands.

## Rule

Always prefix shell commands with `/opt/homebrew/bin/rtk`.

Examples:

```bash
/opt/homebrew/bin/rtk git status
/opt/homebrew/bin/rtk cargo test
/opt/homebrew/bin/rtk npm run build
/opt/homebrew/bin/rtk pytest -q
```

## Meta Commands

```bash
/opt/homebrew/bin/rtk gain            # Token savings analytics
/opt/homebrew/bin/rtk gain --history  # Recent command savings history
/opt/homebrew/bin/rtk proxy <cmd>     # Run raw command without filtering
```

## Verification

```bash
/opt/homebrew/bin/rtk --version
/opt/homebrew/bin/rtk gain
test -x /opt/homebrew/bin/rtk
```
