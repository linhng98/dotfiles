# zsh promt
export VIRTUAL_ENV_DISABLE_Prompt=0

# golang env
export GOPATH=$HOME/.gopath
export PATH=$PATH:$GOPATH/bin

# scala
export SBT_PATH=$HOME/.local/share/sbt
export PATH=$PATH:$SBT_PATH/bin

# yarn
export PATH=$PATH:$HOME/.yarn/bin

# minikube disable emoji
export MINIKUBE_IN_COLOR=false
export MINIKUBE_IN_STYLE=false

# zsh
export ZSH_DOTENV_PROMPT=always

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
export CLOUDSDK_PYTHON="/usr/bin/python"
