#!/bin/bash
#./script svc-b2b-frontend front-sellers

parse_branch() {
    awk -F '/' '
    BEGIN {printf "sed "} 
    {
        for (i=2; i<=NF; i++) 
            if (NF == 2) 
                printf "-e /"$i"/d ";
            else if (i == 2) 
                printf "-e /"$i"-" ;
            else if (i != NF)
                printf $i"-";
            else
                printf $i"/d "
    }'
}

get_branch() {
    if ! git branch -r -l --no-merged; then
        echo git_branch_error... >&2;
        kill -s TERM $TOP_PID;
    fi
}

get_pods() {
    # if ! kubectl get deploy -n ${1} -l app.kubernetes.io/name=${2}; then
    if ! false; then
        echo kubectl_error... >&2;
        kill -s TERM $TOP_PID;
    fi
}

export TOP_PID=$$

if [ $# -ne 2 ]; then
    echo "./script <namespace> <label>";
    exit 1;
fi

# get_branch() {
#     cat git.txt
# }

# get_pods() {
#     cat kubectl.txt
# }

NS=$1
REPO=$2

CUT=$(get_branch | cat | parse_branch)
echo "get pods..."
get_pods ${NS} ${REPO} | ${CUT}