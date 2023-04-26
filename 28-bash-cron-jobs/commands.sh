kubectl create cronjob bash-cron --image=alpine --schedule='* * * * *' --restart=OnFailure -- date

for ((i=1;i<=5;i++)); do
    sleep 60

    kubectl get cj

    kubectl get pods
done

kubectl delete cronjob bash-cron
