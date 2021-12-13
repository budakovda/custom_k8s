# README.md

Написать скрипт который будет выводить поды в кластере разработки, для которых удалены ветки

```sh
#repo_name
git remote show origin
git config --get remote.origin.url
```

```sh
# branches to sed
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
```

```sh
# inputs

NS=<namespace>
REPO=<custom-repo>

get_branch() {
    git branch -r -l --no-merged  | cat
    # cat git.txt
}

get_pods() {
    kubectl get deploy -n ${NS} -l app.kubernetes.io/name=${REPO}
    # cat kubectl.txt
}

CUT=$(get_branch | parse_branch)
get_pods | $CUT

deployments=$(cat kubectl.txt)
branches=$(cat git.txt  | sed  -e 's/origin\//front-sellers-/' -e 's/\//-/' -e 's/$/-server/')


```
