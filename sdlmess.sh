#!/bin/sh

# Create a variable equal to $HOME that will be used later in the ini creation
home=('$HOME')

if [ "$1" != "" ] && [ "$1" = "--newini" ]; then
  echo "Rebuilding the ini file at $HOME/.mess/mess.ini"
  echo "Modify this file for permanent changes to your SDLMESS"
  echo "options and paths before running SDLMESS again."
  cd $HOME/.mess
  if [ -e mess.ini ]; then
    echo "Your old ini file has been renamed to mess.ini.bak"
    mv mess.ini mess.ini.bak
  fi
  /usr/share/sdlmess/sdlmess \
    -artpath "$home/.mess/artwork;artwork" \
    -ctrlrpath "$home/.mess/ctrlr;ctrlr" \
    -cheatpath "$home/.mess/cheat" \
    -crosshairpath "$home/.mess/crosshair" \
    -hashpath "$home/.mess/hash;hash" \
    -inipath $home/.mess/ini \
    -rompath $home/.mess/roms \
    -samplepath $home/.mess/samples \
    -cfg_directory $home/.mess/cfg \
    -comment_directory $home/.mess/comments \
    -diff_directory $home/.mess/diff \
    -input_directory $home/.mess/inp \
    -nvram_directory $home/.mess/nvram \
    -snapshot_directory $home/.mess/snap \
    -state_directory $home/.mess/sta \
    -video opengl \
    -createconfig
elif [ ! -e $HOME/.mess ]; then
  echo "Running SDLMESS for the first time..."
  echo "Creating an ini file for SDLMESS at $HOME/.mess/mess.ini"
  echo "Modify this file for permanent changes to your SDLMESS"
  echo "options and paths before running SDLMESS again."
  mkdir $HOME/.mess
  mkdir $HOME/.mess/{artwork,cfg,cheat,comments,crosshair,ctrlr,diff,hash,ini,inp,nvram,samples,snap,sta,roms}
  cd $HOME/.mess
  /usr/share/sdlmess/sdlmess \
    -artpath "$home/.mess/artwork;artwork" \
    -ctrlrpath "$home/.mess/ctrlr;ctrlr" \
    -cheatpath "$home/.mess/cheat" \
    -crosshairpath "$home/.mess/crosshair" \
    -hashpath "$home/.mess/hash;hash" \
    -inipath $home/.mess/ini \
    -rompath $home/.mess/roms \
    -samplepath $home/.mess/samples \
    -cfg_directory $home/.mess/cfg \
    -comment_directory $home/.mess/comments \
    -diff_directory $home/.mess/diff \
    -input_directory $home/.mess/inp \
    -nvram_directory $home/.mess/nvram \
    -snapshot_directory $home/.mess/snap \
    -state_directory $home/.mess/sta \
    -video opengl \
    -createconfig
else
  cd /usr/share/sdlmess
  ./sdlmess "$@"
fi
