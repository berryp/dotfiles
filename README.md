# dotfiles

## zsh

### Prezto

[Prezto on Github](https://github.com/sorin-ionescu/prezto)

```shell
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
setopt EXTENDED_GLOB
```

### Kubernetes prompt

[ZSH Kubernetes Prompt on Github](https://github.com/superbrothers/zsh-kubectl-prompt)

```shell
git clone https://github.com/superbrothers/zsh-kubectl-prompt.git ~/.zsh-kubectl-prompt
```

### gcloud

Run the [interactive installer](https://cloud.google.com/sdk/downloads#interactive) setting
the installation directory to `~/google-cloud-sdk` and choose NOT to update shell.


Configure environment and install components:

```
gcloud init
gcloud components install kubectl pubsub-emulator container-builder-local docker-credential-gcr beta
```

### Octave

```shell
brew tap brewsci/base
brew install octave
````

### Dotfiles

```shell
git clone https://github.com/berryp/dotfiles.git $HOME/.dotfiles

setopt EXTENDED_GLOB

for rcfile in $HOME/.dotfiles/runcoms/^README.md(.N); do
  rm "$HOME/.${rcfile:t}"
  ln -s "${rcfile}" "$HOME/.${rcfile:t}"
done
```
