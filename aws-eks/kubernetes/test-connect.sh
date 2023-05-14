# Test to connect the pod via loadbalancer dns

RED='\033[31m'
GREEN='\033[32m'
NC='\033[0m' # No Color

HOSTNAME=$(kubectl get svc nginx-svc -o=jsonpath='{.status.loadBalancer.ingress[*].hostname}')

printf "\n### Waiting for the LoadBalancer ###\n"

LB_NAME=${HOSTNAME:0:32}

while [[ ! $(aws elb describe-instance-health --load-balancer-name $LB_NAME --output text) =~ "InService" ]]; do
    printf "."
    sleep 10
done

printf "\n### Loadbalancer health ###\n"
aws elb describe-instance-health --load-balancer-name $LB_NAME --output text

sleep 10

printf "\nLoadBalancer is ${GREEN}OK${NC}\n"

printf "\n### Accessing $HOSTNAME ###\n"

if [[ $(curl -s $HOSTNAME) = "<h1>First aws eks</h1>" ]]; then
    printf "\n=> Test ${GREEN}OK${NC}\n\n"
else
    printf "\n^=> Test ${RED}ERROR${NC}\n\n"
fi

printf "### Access the application on: ###\n"
printf "${HOSTNAME}"
