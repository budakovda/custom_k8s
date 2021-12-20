#!/bin/bash
# shellcheck disable=2086
#./script svc-b2b-frontend front-sellers

parse_branch() {
    echo $stdin
    echo -n "sed "
    awk -F '/' '
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
        echo git_branch_list_error... >&2;
        kill -s TERM $TOP_PID;
    fi
}

get_pods() {
    if ! kubectl get deploy -n ${1} -l app.kubernetes.io/name=${2}; then
        echo kubectl_get_pods_error... >&2;
        kill -s TERM $TOP_PID;
    fi
}

get_branch() {
    git branch -r -l --no-merged  | cat
}

get_pods() {
    kubectl get deploy -n ${NS} -l app.kubernetes.io/name=${REPO}
}


export TOP_PID=$$

if [ $# -ne 2 ]; then
    echo "./script <namespace> <label>";
    exit 1;
fi

NS=$1
REPO=$2

arr=($(get_branch))
num=${#arr[@]}
if [ $num -eq 0 ]; then
    echo empty_list_branches >&2;
    exit 1;
fi

i=0;
CUT=$(while [ $i -lt $num ]; do echo ${arr[i]}; ((i++)); done | parse_branch)

echo "get pods..."
get_pods ${NS} ${REPO} | tee /dev/null | ${CUT}
