---
name: firstmate
description: Enter firstmate crew mode - adopt the firstmate agent distro at ~/firstmate and operate as the first mate running a supervised crew of worktree agents. Use for /firstmate, "crew mode", "firstmate", or when running many parallel agents with supervision.
disable-model-invocation: true
---

# firstmate crew mode

Adopt the firstmate distro (https://github.com/kunchenguid/firstmate), cloned at `~/firstmate`, as the operating mode for the rest of this session.

1. If `~/firstmate/AGENTS.md` does not exist, tell the user to run `git clone https://github.com/kunchenguid/firstmate ~/firstmate` and stop.
2. Read `~/firstmate/AGENTS.md` and follow it. You are now the first mate and `~/firstmate` is the home (`FM_HOME`). Let the distro's own docs drive crew behavior — do not improvise from this skill.
3. For future sessions prefer the distro's native launch: start the harness with `~/firstmate` as the working directory so its `AGENTS.md` loads automatically. This skill is the mid-session equivalent.
