# springboot-knative
Running springboot microservices as knative serverless application.


1)  Installing Knative & Kourier

    Please follow the steps below for installing Knative & Kourier
    https://knative.dev/docs/install/any-kubernetes-cluster/

2) Building & Pushing docker images to Dockerhub registry
   
    Building Image,

   `docker build -t {username}/helloworld-java-spring .`
  
     Pushing Image to registry,

    `docker push {username}/helloworld-java-spring`
    
    Here "username" is here dockerhub username.

3)  Running apllication as Knative service 

    `kubectl apply --filename service.yaml`
    
4) To find the URL for Spring Hello world service
 run the below command
```
kubectl get ksvc helloworld-java-spring \
    --output=custom-columns=NAME:.metadata.name,URL:.status.url
 
 NAME                       URL
 helloworld-java-spring    http://helloworld-java-spring.default.127.0.0.1.xip.io
```

5) Make the request to URL

```
curl http://helloworld-java-spring.default.127.0.0.1.xip.io

Hello World
```