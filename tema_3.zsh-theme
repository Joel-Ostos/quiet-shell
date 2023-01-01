

# PROMPT ===================================================

PROMPT="%F{214}┌⤙%F{80}(%F{61}%~%f%F{80})%f%F{1}$(git_branch)$(git_dirty)%f
%F{214}└──%F{80}(%f%F{214}%D%f%F{80})%f%F{214}⤚ %f"

RPS1='${return_code}'

# right prompt
(( $+functions[virtualenv_prompt_info] )) && RPS1+='$(virtualenv_prompt_info)'

RPS1+="%F{80}(%F{214}%T%f%F{80})%f"

# virtualenv settings
ZSH_THEME_VIRTUALENV_PREFIX=" $FG[075]["
ZSH_THEME_VIRTUALENV_SUFFIX="]%{$reset_color%}"


# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{1}✗%f%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[white]%})"

