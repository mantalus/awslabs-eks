# awslabs-eks

This repository contains the infrastructure and code for a quick look and play with [AWS EKS](https://docs.aws.amazon.com/eks/latest/userguide/what-is-eks.html).

## Ansible

Using ansible here to do the cloudformation orchestration.  Just a test to see how it compares
to other tools and whether its a decent alternative in CI/CD pipelines.

## Tools

* [make](https://www.gnu.org/software/make/manual/make.html)
* [yamllint](https://github.com/adrienverge/yamllint)
* [shellcheck](https://github.com/koalaman/shellcheck)
* [mustache for bash (mo)](https://mustache.github.io/)
* [aws cli](https://github.com/aws/aws-cli)
* [eks tools](https://docs.aws.amazon.com/eks/latest/userguide/getting-started.html)


## Configure

Install kubectl and other tools as per the getting started guide -  https://docs.aws.amazon.com/eks/latest/userguide/getting-started.html


## Deploy

1. Set your aws environment.
2. Make deploy should create all the infrastructure, setup your local kubernetes config and
and create the nginx app and dashboard.
```
AWS_DEFAULT_REGION=us-west-2 ENVIRONMENT=dev KEY_NAME=<yourkeyname> make deploy
```
```
export KUBECONFIG=$KUBECONFIG:~/.kube/config-<clusternamee>
```

Cluster Name and Environment are synonymous.

## Sample App

Run a basic nginx container.  Now part of make deploy but update nginx version and see rolling update in action.

```
kubectl apply -f nginx.yaml
```

Create the service to get an external ip.

```
kubectl apply -f nginx-service.yaml
```

## Kubernetes Dashboard

```
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep eks-admin | awk '{print $1}')
```
Start the kubectl proxy.
```
kubectl proxy
```

Open the following link with a web browser to access the dashboard endpoint: http://localhost:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/

## Commands

```
kubectl get services -o wide
```
```
kubectl get pods -l app=nginx
```
```
kubectl describe pod <podname>
```
