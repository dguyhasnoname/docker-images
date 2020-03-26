
PATH=$PATH:$HOME/bin
export LC_ALL=en_US.UTF-8
export PATH

alias ll="ls -lrt"
alias go2="/Users/mukund/scripts/go2.sh"
alias gp="git push origin HEAD"
alias gcm="git commit -m $1"
alias gs="git status"
alias ga="git add"
alias gb="git branch"
alias gc="git checkout"


alias pass="cat ~/scripts/passwd | xclip"
alias kg="kubectl get"
alias kd="kubectl describe"
alias kl="kubectl logs"
alias ke="kubectl edit"
alias kge="kubectl get events --v=9"
alias kdel="kubectl delete"
alias kgp="kubectl get po -n kube-system"
alias kgc="kubectl get po -o jsonpath='{.spec.containers[*].name}'"
alias kgds="kubectl get daemonsets -n kube-system"
alias kgsvc="kubectl get services"
alias kgrs="kubectl get replicasets"
alias kgn="kubectl get no"
alias kexec='kubectl exec -it "$@"' 


alias kgr='function _kgr(){ for i in role rolebindings; do echo $i.............;kubectl get $i -n "$@";echo "---------------"; done };_kgr'
alias kmpd="/git/pod_operation_scripts/multiple_pod_delete.sh"
alias kevicted="/Users/mukund/scripts/list_evicted_pods.sh"
alias kpe="/git/pod_operation_scripts/pod_error_count.sh"
alias kpr="/git/pod_operation_scripts/container_exitcode.sh"
alias pressure="/git/kubelet/kubelet_check.sh"
alias setns='function _setns(){ kubectl config set-context --current=true --namespace="$@"; }; _setns'
alias nsd="/git/namespace_scripts/get_namespace_objects.sh"
alias debug="/git/namespace_scripts/debug_app_namespace.sh"
alias check="python  /git/python/list_pods.py"
alias whichns="kubectl  config view |  grep namespace"


alias hls="helm ls"
alias hdel="helm delete"


alias openebs="kubectl get po -n openebs -o wide"
alias mayactl='/git/openebs/check_sync.sh'
alias zfs='/git/pod_operation_scripts/zfs.sh'
alias vel="kubectl get po -n velero -o wide"

alias monitoring="kubectl get po -n monitoring"

alias vs="vault status"
alias vt="/Users/mukund/git/ppco/ops/vault-tree"
