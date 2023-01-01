#repo: https://github.com/Joel-Ostos/quiet-shell

NEWLINE=$'\n'

# PROMPT ===================================================
# principal prompt

PROMPT="%F{214}┌⤙%F{80}(%F{61}%~%f%F{80})%f"

#checking if git info is available
(( $+functions[git_prompt_info] )) && PROMPT+='$(git_prompt_info)'

PROMPT+="${NEWLINE}%F{214}└──%F{80}(%f%F{214}%D%f%F{80})%f%F{214}⤚ %f"

# right prompt
#checking if a virtualenv is already running

(( $+functions[virtualenv_prompt_info] )) && RPS1+='$(virtualenv_prompt_info)'

RPS1+="%F{80}(%F{214}%T%f%F{80})%f"

# virtualenv settings
ZSH_THEME_VIRTUALENV_PREFIX=" $FG[075]["
ZSH_THEME_VIRTUALENV_SUFFIX="]%{$reset_color%}"


# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$fg[cyan]%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{1} ✗%f%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%} ✔%f%{$reset_color%}"


#Thanks for checkout my terminal, enjoy :D
