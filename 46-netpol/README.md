1. Created a pod named `secure-pod`
1. Created a network policy to deny any ingress request to all pods.
1. Created a service named `secure-service` to expose the `secure-pod` on por 80.
1. Created a second pod named `webapp` to try to connect to `secure-pod`.
1. The connection is aborted because of the network policy.
1. Created a new network policy to allow only the pods with label `app: webapp` to connect to `secure-pod`.
1. Now the connection must work.
