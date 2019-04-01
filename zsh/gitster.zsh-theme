local ret_status="%(?:%{$fg_bold[green]%}-- :%{$fg_bold[red]%}--%s)"

function get_pwd(){
  git_root=$PWD
  
  while [[ $git_root != / && ! -e $git_root/.git ]]; do
    git_root=$git_root:h
  done

  if [[ $git_root = / ]]; then
    unset git_root
    prompt_short_dir=%~
  else
    parent=${git_root%\/*}
    prompt_short_dir=${PWD#$parent/}
  fi

  echo $prompt_short_dir
}

PROMPT='$ret_status %{$fg[magenta]%}$(get_pwd) $(git_prompt_info) %{$reset_color%}»%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}<"
ZSH_THEME_GIT_PROMPT_SUFFIX=">%{$reset_color%}"