# Basic Zsh
echo "Installing Zsh on Arch Linux..."
if command -v zsh >/dev/null 2>&1 ; then
  echo ""
  echo "✔️  Zsh is installed."
else
  sudo pacman -S zsh zsh-completions
  echo ""
  echo "✔️  Zsh installed."
fi

# Powerlevel10k theme
echo ""
echo "Installing powerlevel10k theme..."
if [ -f /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme ]; then
  echo ""
  echo "✔️  Powerlevel10k is installed."
else
  yay -S zsh-theme-powerlevel10k-git 
  echo ""
  echo "✔️  Powerlevel10k installed."
fi


# Profile Dependencies
echo ""
echo "Installing profile dependencies..."
MISSING=""
if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  echo ""
  echo "✔️  Zsh syntax highlighting is installed."
else
  TEMP="$MISSING zsh-syntax-highlighting"
  MISSING=$TEMP
fi
if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  echo ""
  echo "✔️  Zsh auto suggestions is installed."
else
  TEMP="$MISSING zsh-autosuggestions"
  MISSING=$TEMP
fi
if [ -f /usr/share/doc/pkgfile/command-not-found.zsh ]; then
  echo ""
  echo "✔️  pkgfile is installed."
else
  TEMP="$MISSING pkgfile"
  MISSING=$TEMP
fi

if [ -n "$MISSING" ] ; then
  echo "❌ Missing: $MISSING"
  echo "Attempt to install them with yay:"
  yay -S $MISSING 
  echo ""
  echo "✔️  Zsh profile dependencies are installed."
fi

# Update pkgfile db
sudo pkgfile --update

# Profile
cp ./zsh-configs/.p10k.zsh $HOME
cp ./zsh-configs/.zshrc $HOME
echo ""
echo "✔️  Zsh custom profile applied."

# Make Zsh default shell
chsh -s /usr/bin/zsh
echo ""
echo "✔️  The default shell changed to Zsh."

echo ""
echo "You can now run 'zsh'"