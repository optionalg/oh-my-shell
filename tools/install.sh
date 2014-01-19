#!/usr/bin/env bash
OHMYSHELL=`/usr/bin/env | grep 'OHMYSHELL=' | cut -d '=' -f 2`

# Check for installation or for pre existing directory
if [[ -d "$OHMYSH" ]] ;
then
  echo -e "\033[0;33mYou already have Oh My Shell installed.\033[0m You'll need to remove $OHMYSHELL if you want to install"
  exit
elif [[ -d $HOME/.oh-my-shell ]] ;
then
  echo -e "\033[0;33mYou already have Oh My Shell installed.\033[0m You'll need to remove $HOME/.oh-my-sh if you want to install"
  exit
fi

# Clone Oh My shell
echo -e "\033[0;34mCloning Oh My Shell...\033[0m"
hash git >/dev/null && /usr/bin/env git clone https://github.com/NeuralSandwich/oh-my-shell.git $HOME/.oh-my-shell || {
  echo "git not installed"
  exit
}

# Backup zsh config files
backup_zsh() {
  if [[ -f $HOME/.zshrc ]] || [[ -h $HOME/.zshrc ]] ;
  then
    echo -e "\033[0;33mFound $HOME/.zshrc.\033[0m \033[0;32mBacking up to $HOME/.zshrc.pre-oh-my-shell\033[0m";
    mv $HOME/.zshrc $HOME/.zshrc.pre-oh-my-shell;
  fi
}

# Backup bash config files
backup_bash() {
  if [[ -f $HOME/.bash_profile ]] || [[ -h $HOME/.bash_profile ]] ;
  then
    echo -e "\033[0;33mFound $HOME/.bash_profile.\033[0m \033[0;32mBacking up to $HOME/.bash_profile.pre-oh-my-shell\033[0m";
    mv $HOME/.bash_profile $HOME/.bash_profile.pre-oh-my-shell;
  fi
}



# Backup config files
backup() {
  backup_zsh
  backup_bash
}

# Copy bash templates
copy_bash() {
  echo -e "\033[0;34mUsing the Oh My Shell template file and adding it to $HOME/.bash_profile\033[0m"
  cp $HOME/.oh-my-shell/templates/bash_profile.bash-template $HOME/.bash_profile
}

# Copy zsh templates
copy_zsh() {
  echo -e "\033[0;34mUsing the Oh My Shell template file and adding it to $HOME/.zshrc\033[0m"
  cp $HOME/.oh-my-shell/templates/zshrc.zsh-template $HOME/.zshrc
}

# Copy template files
copy_templates() {
  copy_zsh
  copy_bash
}

# Ask for default shell
read -p "What shell do you mainly use? 1. Zsh or 2. Bash " RESP
backup
copy_templates

case $RESP in
  1)
  chsh -s `which zsh`
  ;;
  2)
  chsh -s `which bash`
  ;;
esac

echo -e "\033[0;32m"'         __                               __         ____'"\033[0m"
echo -e "\033[0;32m"'  ____  / /_     ____ ___  __  __   _____/ /_  ___  / / /'"\033[0m"
echo -e "\033[0;32m"' / __ \/ __ \   / __ `__ \/ / / /  / ___/ __ \/ _ \/ / / '"\033[0m"
echo -e "\033[0;32m"'/ /_/ / / / /  / / / / / / /_/ /  (__  ) / / /  __/ / /  '"\033[0m"
echo -e "\033[0;32m"'\____/_/ /_/  /_/ /_/ /_/\__, /  /____/_/ /_/\___/_/_/   '"\033[0m"
echo -e "\033[0;32m"'                        /____/                           '"\033[0m"

echo -e "\n\n \033[0;32m....is now installed.\033[0m"

