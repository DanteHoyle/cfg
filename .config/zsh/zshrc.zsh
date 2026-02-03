for conf in ~/.config/zsh/conf.d/*.zsh; do
  source "$conf"
done

# source local overrides (not tracked by git)
[[ -f ~/.config/zsh/local.zsh ]] && source ~/.config/zsh/local.zsh
