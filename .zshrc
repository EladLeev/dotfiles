# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="miloshadzic"

plugins=(
    git
    kubectl
)

source $ZSH/oh-my-zsh.sh

##########################
## Elad's Custom Config ##
##########################

## History ##
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
# Immediate append
setopt INC_APPEND_HISTORY
export HISTTIMEFORMAT="[%F %T] "
# Keep full Timestamp
setopt EXTENDED_HISTORY

## Aliases ##
alias kns=kubens
alias ktx=kubectx
alias k=kubectl
alias kgp="kubectl get pods"
alias kgi="kubectl get ingress"
alias kgs="kubectl get svc"
alias kge="kubectl get events --sort-by='.metadata.creationTimestamp'"
alias kdp="kubectl describe pods"
alias kgn="kubectl get ns"
alias kgd="kubectl get deployment"

## Utils ##

# decode k8s secret
k8s-decode() {
    kubectl get secret $1 -o go-template='
{{range $k,$v := .data}}{{printf "%s: " $k}}{{if not $v}}{{$v}}{{else}}{{$v | base64decode}}{{end}}{{"\n"}}{{end}}'
}

# open PR with a ticket
git_commit_push_ticket() {
    local branch_name=$(git rev-parse --abbrev-ref HEAD)
    local ticket_number=$(echo $branch_name | grep -oE '[A-Z]+-[0-9]+')

    if [[ -z "$ticket_number" ]]; then
        echo "Error: Unable to extract ticket number from branch name."
        return 1
    fi

    if [[ -z "$1" ]]; then
        echo "Error: Commit message is required."
        return 1
    fi

    git commit -m "$ticket_number $1"
    git push origin $branch_name
}

source <(kubectl completion zsh)

## oh-my-posh
if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
    eval "$(oh-my-posh init zsh --config /Users/eladleev/theme.omp.json)"
fi
