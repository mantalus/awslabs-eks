# awslabs-alb-redirect-fargate

## How To

1. Create a self signed cert.

```
ENVIRONMENT=dev make cert
```

2. Grab the ARN from the output.
3. Make deploy.

```
CERTIFICATE=<ARN from step 1> ENVIRONMENT=dev make deploy
```

4. Get the Service URL from output of make deploy and run curl.

```
curl -kLi <Service URL>
```
