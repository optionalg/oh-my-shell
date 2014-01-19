# Check for updates on initial load...
if [ "$OHMYSHELL_DISABLE_AUTO_UPDATE" != "true" ]; then
  /usr/bin/env bash $OHMYSHELL/tools/check_for_upgrade.sh
fi

CURSHELL=`echo $SHELL| sed 's/.*\/bin\///'`

# Set OHMYSHELL_CUSTOM to the path where your custom config files
# and plugins exists, or else we will use the default custom/
if [[ -z "$OHMYSHELL_CUSTOM" ]] ; then
    OHMYSHELL_CUSTOM="$OHMYSHELL/custom"
fi

if [[ $CURSHELL -eq "zsh" ]] ;
then
	source $OHMYSHELL/oh-zsh.sh
elif [[ $CURSHELL -eq "bash" ]] ;
then
	source $OHMYSHELL/oh-bash.sh
fi
