alias k=kubectl

printf "Explain the pod image: \n\n"

kubectl explain pod.spec.containers.image


printf "\n\nExplain the claimRef for a PersistentVolume"

kubectl explain pv.spec.claimRef