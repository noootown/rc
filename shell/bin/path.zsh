export GOPATH="${HOME}/go"
PATH="${GOPATH}/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/local/bin:${HOME}/Library/Android/sdk/tools:${HOME}/Library/Android/sdk/platform-tools:${PATH}"
PATH="$PATH:`yarn global bin`"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

#for react-native
export ANDROID_HOME="${HOME}/Library/Android/sdk"

