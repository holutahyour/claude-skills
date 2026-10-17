#!/bin/sh
# Routes ideas, plans, skill choices and agent output through the challenge-idea skill.
# Wired by hooks/hooks.json on UserPromptSubmit, PostToolUse (Skill|Agent) and SubagentStart.
# Prints a hookSpecificOutput.additionalContext reminder; never blocks anything.
# POSIX sh, not PowerShell: this runs on every prompt and powershell.exe startup measured ~6x slower.

payload=$(cat)
event=$(printf '%s' "$payload" | sed -n 's/.*"hook_event_name"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p')
context=""

case "$event" in
  UserPromptSubmit)
    context="[challenge-idea] If this message proposes, requests or approves an idea, plan, design, approach, or skill/agent choice of real consequence - or you are about to present or execute a plan of your own - run the challenge-idea skill on it first (LIGHT pass for small ideas, FULL for costly or hard-to-reverse ones). Skip for plain questions, trivial edits, and go-aheads on an idea already challenged."
    ;;
  PostToolUse)
    tool=$(printf '%s' "$payload" | sed -n 's/.*"tool_name"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p')
    if [ "$tool" = "Skill" ]; then
      skill=$(printf '%s' "$payload" | sed -n 's/.*"skill"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/p')
      # Never challenge the challenger or the router that hands work to it.
      case "$skill" in
        challenge-idea|*:challenge-idea|routing-work|*:routing-work) exit 0 ;;
      esac
      context="[challenge-idea] You just loaded skill '$skill'. Before following it, confirm the choice holds up: does the task's shape really match this skill, and is it better than the alternatives or doing it directly? If the task is substantial and the choice is doubtful, run challenge-idea on it."
    elif [ "$tool" = "Agent" ]; then
      context="[challenge-idea] The agent's findings and recommendations are ideas, not verdicts. Before adopting any of consequence, run challenge-idea on them (did the agent verify its claims, or assume them?)."
    fi
    ;;
  SubagentStart)
    context="[challenge-idea] Before you recommend or act on an idea, plan or approach of real consequence, challenge it: steelman it, find its weak points against the actual context (cite evidence), and return the improved version. Use the challenge-idea skill if you have the Skill tool."
    ;;
esac

[ -z "$context" ] && exit 0

# Escape for JSON: only backslash and double quote can occur in these strings.
esc=$(printf '%s' "$context" | sed 's/\\/\\\\/g; s/"/\\"/g')
printf '{"hookSpecificOutput":{"hookEventName":"%s","additionalContext":"%s"}}\n' "$event" "$esc"
exit 0
