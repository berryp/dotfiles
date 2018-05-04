if (( ! ${+commands[kubectl]} )); then
  return 1
fi

# Enable completion for 'kubectl'.
cache_file="${0:h}/cache.zsh"
kubectl_command="${commands[kubectl]}"

if [[ "${kubectl_command}" -nt "${cache_file}" || ! -s "${cache_file}" ]]; then
  ${kubectl_command} completion zsh >! "${cache_file}" 2> /dev/null
fi

source "${cache_file}"
unset cache_file kubectl_command

#
# Aliases
#

alias kc='kubectl'

alias kca='kubectl apply'
alias kcc='kubectl config'
alias kccg='kubectl config get-contexts'
alias kccu='kubectl config use-context'
alias kccv='kubectl config view'
alias kcC='kubectl create'
alias kcD='kubectl delete'
alias kcd='kubectl describe'
alias kce='kubectl exec'
alias kcf='kubectl port-forward'
alias kcg='kubectl get'
alias kcl='kubectl logs'
alias kclf='kubectl logs --follow'
alias kcr='kubectl run'

alias kx='kubectx'
alias kn='kubens'

alias wkb='watch -n 1 kubectl'

kbn () {
  kubectl config set-context $(kubectl config current-context) --namespace=$1
}

# Cluster name formatting
zstyle ':prezto:module:contrib-kubernetes' prod-clusters-default '^(?!.*dev).*$'