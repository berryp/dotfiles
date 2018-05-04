# dotfiles

## zsh

### Prezto

[Prezto on Github](https://github.com/sorin-ionescu/prezto)

```shell
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB

for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

rm $HOME/.zpreztorc
rm $HOME/.zshrc

for rcfile in "${ZDOTDIR:-$HOME}"/.dotfiles/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
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
