kubectl create deployment my-deploy --image=nginx:latest --replicas=3

kubectl set image deployment my-deploy nginx=nginx:1.24

kubectl set image deployment my-deploy nginx=nginx:latest --record

kubectl rollout history deployment my-deploy

kubectl rollout history deployment my-deploy --revision 1

kubectl rollout history deployment my-deploy --revision 2

kubectl rollout undo deployment/my-deploy

kubectl rollout history deployment/my-deploy

kubectl rollout undo deployment/my-deploy --to-revision=5

kubectl rollout history deployment/my-deploy