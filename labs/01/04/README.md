Create a new deployment called `nginx-deploy`, with one single container called `nginx`, image `nginx:1.16` and `4 replicas`.
The deployment should use `RollingUpdate` strategy with `maxSurge=1`, and `maxUnavailable=2`.

Next upgrade the deployment to version `1.17`.

Finally, once all pods are updated, undo the update and `go back` to the previous version.