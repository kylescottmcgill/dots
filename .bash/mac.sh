unalias ls
export BASH_SILENCE_DEPRECATION_WARNING=1
export HOMEBREW_NO_ENV_HINTS=1

eval "$(/opt/homebrew/bin/brew shellenv)"


if [ "$ALACRITTY" = "true" ]
then
  theme() {
    ln -sf $HOME/.config/alacritty/themes/themes/$1.toml $HOME/.config/alacritty/active-theme.toml
  }

  ALACRITTY_THEME=$(defaults read -g AppleInterfaceStyle 2>/dev/null || echo "Light")

  if [ "$ALACRITTY_THEME" = "Dark" ]
  then
    theme "pencil_dark"
  else
    theme "pencil_light"
  fi
fi
