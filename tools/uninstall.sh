#!/usr/bin/env bash

echo "Removed $HOME/.oh-my-shell"
if [[ -d $HOME/.oh-my-shell ]] ;
then
	rm -rf $HOME/.oh-my-shell
fi

echo "Looking for original bash and zsh configs..."
if [ -f $HOME/.zshrc.pre-oh-my-shell ] || [ -h $HOME/.zshrc.pre-oh-my-shell ]
then
  echo "Found $HOME/.zshrc.pre-oh-my-shell -- Restoring to $HOME/.zshrc";

  if [ -f $HOME/.zshrc ] || [ -h $HOME/.zshrc ]
  then
    ZSHRC_SAVE=".zshrc.oms-uninstalled-`date +%Y%m%d%H%M%S`";
    echo "Found $HOME/.zshrc -- Renaming to $HOME/${ZSHRC_SAVE}";
    mv $HOME/.zshrc $HOME/${ZSHRC_SAVE};
  fi

  mv $HOME/.zshrc.pre-oh-my-shell $HOME/.zshrc;

fi

if [ -f $HOME/.bash_profile.pre-oh-my-shell ] || [ -h $HOME/.bash_profile.pre-oh-my-shell ]
then
  echo "Found $HOME/.bash_profile.pre-oh-my-shell -- Restoring to $HOME/.bash_profile";

  if [ -f $HOME/.bash_profile ] || [ -h $HOME/.bash_profile ]
  then
    bash_profile_SAVE=".bash_profile.oms-uninstalled-`date +%Y%m%d%H%M%S`";
    echo "Found $HOME/.bash_profile -- Renaming to $HOME/${bash_profile_SAVE}";
    mv $HOME/.bash_profile $HOME/${bash_profile_SAVE};
  fi

  mv $HOME/.bash_profile.pre-oh-my-shell $HOME/.bash_profile;

fi

echo "Thanks for trying out Oh My Shell. It's been uninstalled."
