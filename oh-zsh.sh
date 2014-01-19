# Load the theme
if [ ! "$SHELL_THEME" = ""  ]]; then
	if [ -f "$OHMYSHELL_CUSTOM/$SHELL_THEME.zsh-theme" ]; then
		source "$OHMYSHELL_CUSTOM/$SHELL_THEME.zsh-theme"
	elif [ -f "$OHMYSHELL_CUSTOM/themes/$SHELL_THEME.zsh-theme" ]; then
		source "$OHMYSHELL_CUSTOM/themes/$SHELL_THEME.zsh-theme"
	else
		source "$OHMYSHELL/themes/$SHELL_THEME.zsh-theme"
	fi
fi
