# default editor
export EDITOR=nvim

# homebrew
export PATH=$PATH:/opt/homebrew/bin

# local home bin
export PATH=$PATH:$HOME/.local/bin

# golang env
export GOPATH=$HOME/.gopath
export PATH=$PATH:$GOPATH/bin

# scala
export SBT_PATH=$HOME/.local/share/sbt
export PATH=$PATH:$SBT_PATH/bin

# yarn
export PATH=$PATH:$HOME/.yarn/bin
export PATH=$PATH:$HOME/.config/yarn/global/node_modules/.bin

# minikube disable emoji
export MINIKUBE_IN_COLOR=false
export MINIKUBE_IN_STYLE=false

# zsh
export ZSH_DOTENV_PROMPT=always
export VIRTUAL_ENV_DISABLE_Prompt=0
export HISTSIZE=1000000
export SAVEHIST=$HISTSIZE

# ibus
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

# vagrant
export VAGRANT_DEFAULT_PROVIDER=libvirt

# android
export ANDROID_SDK_ROOT=$HOME/.android-sdk
export ANDROID_HOME=$HOME/.android-sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$ANDROID_SDK_ROOT/tools
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

# vaapi firefox
export MOZ_X11_EGL=1

# rust
export PATH=$PATH:$HOME/.cargo/bin

# nvidia
export VDPAU_DRIVER=nvidia
export LIBVA_DRIVER_NAME=vdpau
export CLOUDSDK_PYTHON="/usr/bin/python3"

# gke
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

# terraform
export TF_PLUGIN_CACHE_DIR="$HOME/.terraform.d/plugin-cache"

. "$HOME/.cargo/env"

## sway nvidia
#export LIBVA_DRIVER_NAME=nvidia
#export XDG_SESSION_TYPE=wayland
#export XDG_CURRENT_DESKTOP=sway
#export GBM_BACKEND=nvidia-drm
#export __GLX_VENDOR_LIBRARY_NAME=nvidia
#export GTK_THEME=Dracula
#export WLR_NO_HARDWARE_CURSORS=1
#export GDK_BACKEND=wayland
#export WLR_RENDERER=vulkan
##[PREVENT FLICKERING, BUT FUCK UP GAMING]
#export XWAYLAND_NO_GLAMOR=1
#[QT Variables]
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_QPA_PLATFORMTHEME=qt6ct
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
