
PATH=$PATH:$HOME/bin
export LC_ALL=en_US.UTF-8
export PATH
clear
echo -e "\033[1;31mश्री गणेशयाय नमः\033[0m"

alias ll="ls -lrt"

alias gp="git push origin HEAD"
alias gcm="git commit -m $1"
alias gs="git status"
alias ga="git add"
alias gb="git branch"
alias gc="git checkout"
alias gpl="git pull"

alias pass="cat ~/scripts/passwd | xclip"
alias kg="kubectl get"
alias kd="kubectl describe"
alias kl="kubectl logs"
alias ke="kubectl edit"
alias kge="kubectl get events --v=5 --sort-by=.metadata.creationTimestamp --field-selector type!=Normal"
alias kdel="kubectl delete -n kube-system"
alias kgp="kubectl get po -n kube-system"
alias kgm="kubectl get po -n monitoring"
alias kgc="kubectl get po -o jsonpath='{.spec.containers[*].name}'"
alias kgds="kubectl get daemonsets -n kube-system"
alias kgs="kubectl get services -n kube-system"
alias kgrs="kubectl get replicasets"
alias kgn="kubectl get no -o wide"
alias kexec='kubectl exec -it -n kube-system "$@"'
alias kgr='function _kgr(){ for i in role rolebindings; do echo $i.............;kubectl get $i -n "$@";echo "---------------"; done };_kgr'
alias kar="kubectl argo rollouts"
alias bb='kubectl run curl --image=radial/busyboxplus:curl -i --tty'

alias getcfg="/workdir/k8sconfig/pull_kubeconfig_ct.sh"



alias kmdel="/workdir/k8s-day2-ops/pod_operation_scripts/multiple_object_delete.sh"
alias kml="/workdir/k8s-day2-ops/pod_operation_scripts/pod_error_count.sh"
alias kevicted="/workdir/scripts/list_evicted_pods.sh"
alias kpe="/workdir/k8s-day2-ops/pod_operation_scripts/pod_error_count.sh"
alias kpr="/workdir/k8s-day2-ops/pod_operation_scripts/container_exitcode.sh"
alias pressure="/workdir/k8s-day2-ops/kubelet/kubelet_check.sh"
alias setns='function _setns(){ kubectl config set-context --current=true --namespace="$@"; }; _setns'
alias nsd="/workdir/k8s-day2-ops/namespace_scripts/get_namespace_objects.sh"
alias debug="/workdir/k8s-day2-ops/namespace_scripts/debug_app_namespace.sh"
alias check="python  /workdir/k8s-day2-ops/python/list_pods.py"
alias probe='/workdir/k8s-day2-ops/namespace_scripts/probe_namespace_errors.sh'
alias whichns="kubectl  config view |  grep namespace"

alias hls="helm ls -n kube-system"
alias hdel="helm delete"

alias openebs="kubectl get po -n openebs -o wide"
alias mayactl='/workdir/k8s-day2-ops/openebs/check_sync.sh'
alias zfs='/workdir/k8s-day2-ops/pod_operation_scripts/zfs.sh'
alias vel="kubectl get po -n velero -o wide"

alias monitoring="kubectl get po -n monitoring"

alias vs="vault status"
alias vr="vault read"
alias vw="vault write"
alias vt="/workdir/git/ppco/ops/vault-tree"


# prompt_k8s(){
#   git_branch="$(git branch)"
#   #k8s_current_context=$(kubectl config view -o json | jq -r '.clusters[].cluster.server' | sed -e 's/https:\/\/\(.*\):443/\1/' 2> /dev/null)
#   local k8s_current_context=$(kubectl config view | grep server | awk -F '//' '{print $2}' 2> /dev/null)
#   if [[ $? -eq 0 && "$k8s_current_context" != "" ]] ; then echo -e "${k8s_current_context}:"; fi

# }

# PS1="\@ UTC \$(date +%d.%m.%Y): \\[\\033[01;31m\\]\$(prompt_k8s)\\[\\033[0m\\] \W\$ "

k8s_cluster(){
  #k8s_current_context=$(kubectl config view -o json | jq -r '.clusters[].cluster.server' | sed -e 's/https:\/\/\(.*\):443/\1/' 2> /dev/null)
  local k8s_current_context=$(kubectl config view | grep server | awk -F '//' '{print $2}' 2> /dev/null)

  if [[ $? -eq 0 && "$k8s_current_context" != "" ]] ;
  then 
	  # echo -e "\xE2\x98\xB8 ${k8s_current_context} \xE2\x9D\xB1";
    echo -e "\xE2\x98\xB8 ${k8s_current_context}";
  else
	  echo -e "\xE2\x98\xB8"
  fi

}

symbol(){
  echo -e "\xE2\x94\x97\xE2\x94\x81 \xE0\xA5\x90 "
}

dir(){
  echo -e "\xF0\x9F\x93\x81"
}

# git_branch(){
#   git_branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
#   git_diff=$(git diff 2> /dev/null)
#   if [[ "$git_diff" = "" ]];
#   then
#     echo -e "\033[1;35m\xF0\x96\xA6\xA5\033[0m $git_branch"
#   else
#     echo -e "\xE2\x9D\xB1 $git_branch \xE2\x96\xB2"
#   fi
# }

#PS1="[\@ UTC \$(date +%d.%m.%Y) \\[\\033[01;31m\\]\$(k8s_cluster)\\[\\033[0m\\] \\[\\033[01;32m\\]\$(dir)\\[\\033[0m\\] \W \$(git_branch)] \n \\[\\033[01;91;5m\\]\$(symbol) \\[\\033[0m\\]"
PS1="[\@ UTC \$(date +%d.%m.%Y) \\[\\033[01;31m\\]\$(k8s_cluster)\\[\\033[0m\\] \\[\\033[01;32m\\]\$(dir)\\[\\033[0m\\] \W] \n \\[\\033[01;91;5m\\]\$(symbol) \\[\\033[0m\\]"