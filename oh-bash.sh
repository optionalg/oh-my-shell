# Load colors first so they can be use in base theme
source "$OHMYSHELL/themes/colors.bash-theme"

# Load the theme
if [ ! "$SHELL_THEME" = ""  ]]; then
	if [ -f "$OHMYSHELL_CUSTOM/$SHELL_THEME.bash-theme" ]; then
		source "$OHMYSHELL_CUSTOM/$SHELL_THEME.bash-theme"
	elif [ -f "$OHMYSHELL_CUSTOM/themes/$SHELL_THEME.bash-theme" ]; then
		source "$OHMYSHELL_CUSTOM/themes/$SHELL_THEME.bash-theme"
	else
		source "$OHMYSHELL/themes/$SHELL_THEME.bash-theme"
	fi
fi
