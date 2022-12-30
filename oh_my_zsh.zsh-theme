# 021011 zsh theme v2.0.0 - https://github.com/guesswhozzz/021011.zsh-theme

autoload -Uz compinit; compinit

# LOCAL/VARIABLES/ANSI =========================================================

local ANSI_reset="\x1B[0m"
local ANSI_dim_black="\x1B[38;05;236m"

# LOCAL/VARIABLES/GRAPHIC ======================================================

local char_arrow="➮"

# SEGMENT/VCS_STATUS_LINE ========================================================

export VCS="git"

local current_vcs="\":vcs_info:*\" enable $VCS"
local char_badge="%F{238} 𝗈𝗇 %f%F{61}${char_arrow}%f"
local vc_branch_name="%F{3}(%b)%f"

local vc_action="%F{238}%a %f%F{236}${char_arrow}%f"
local vc_unstaged_status="%F{80} M ${char_arrow}%f"

local vc_git_staged_status="%F{115} A ${char_arrow}%f"
local vc_git_hash="%F{151}%6.6i%f %F{61}${char_arrow}%f"
local vc_git_untracked_status="%F{11} ✗ %F{61}${char_arrow}%f"


if [[ $VCS != "" ]]; then
  autoload -Uz vcs_info
  eval zstyle $current_vcs
  zstyle ':vcs_info:*' get-revision true
  zstyle ':vcs_info:*' check-for-changes true
fi

case "$VCS" in 
   "git")
    # git sepecific 
    zstyle ':vcs_info:git*+set-message:*' hooks use_git_untracked
    zstyle ':vcs_info:git:*' stagedstr $vc_git_staged_status
    zstyle ':vcs_info:git:*' unstagedstr $vc_unstaged_status
    zstyle ':vcs_info:git:*' actionformats "  ${vc_action} ${vc_git_hash}%m%u%c${char_badge} ${vc_branch_name}"
    zstyle ':vcs_info:git:*' formats " %c%u%m${char_badge} ${vc_branch_name}"
  ;;

  # svn sepecific 
  "svn")
    zstyle ':vcs_info:svn:*' branchformat "%b"
    zstyle ':vcs_info:svn:*' formats " ${char_badge} ${vc_branch_name}"
  ;;

  # hg sepecific 
  "hg")
    # echo "ставим hg переменные для vcs_info"
    zstyle ':vcs_info:hg:*' branchformat "%b"
    zstyle ':vcs_info:hg:*' formats " ${char_badge} ${vc_branch_name}"
  ;;
esac

# Show untracked file status char on git status line
+vi-use_git_untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2>/dev/null) == "true" ]] &&
    git status --porcelain | grep -m 1 "^??" &>/dev/null; then
    hook_com[misc]=$vc_git_untracked_status
  else
    hook_com[misc]=""
  fi
}

git_status=$(git status --porcelain 2> /dev/null)
    if [[ -z $git_status ]]; then
        prompt+=" %{$fg[green]%}✔%{$reset_color%}"
    fi
# UTILS ========================================================================

setopt PROMPT_SUBST

# Prepare git status line
prepareGitStatusLine() {
  echo '${vcs_info_msg_0_}'
} 



# ENV/VARIABLES/PROMPT_LINES ===================================================

PROMPT="%F{214}┌─  %F{61}%~%f$(prepareGitStatusLine)%F{214} 
└──➢  %f"

RPROMPT="%F{214}(%T %D)%f"

# virtualenv settings
ZSH_THEME_VIRTUALENV_PREFIX=" $FG[075]["
ZSH_THEME_VIRTUALENV_SUFFIX="]%{$reset_color%}"

precmd() {
  if [[ $VCS != "" ]]; then
    vcs_info
  fi
}
