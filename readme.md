## SCOPE ##

The scope of this challenge is to display a webpage with "Lorem Ipsum"

Intially need to have a docker image with Nginx base image so one can host any website and showcase Customized content that need to be on that particular webpage

Created a index.html with custom values 

With the Base Nginx image and custom index.html one can host a webpage 

Refer Dockerfile from the repo

Once the Dockerfile is ready build image using 

``` command: Docker build "name:tag" .```

test the web page locally by running a container with port 80 and name of the image

``` command: docker run -dp 80:80 name:tag ```

If content has to be delivered to larger audiene Kubernetes will be a better option where there is service called horizontal pod scaling when dealing with lot of incoming traffic
 
Push the image built form Dockerfile to docker hub

``` docker push dockerid/name:tag ```

### Testing ###

This is tested in a local environment using minikube

For deployment use 

``` command: kubectl apply -f manifests ``` 

Image in the deployement is pulled form docker hub where pushed to docker in the above step

For hpa require to have metrics-server in order to get resource metrics form the cluster 

so one can deploy metrics-server from following 

``` kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml ```

Kubelet certificate needs to be signed by cluster Certificate Authority (or disable certificate validation by passing --kubelet-insecure-tls to Metrics Server)

this can be done by editing 

``` kubectl -n kube-system edit deploy metrics-server ```

and add following to config file

command:
- /metrics-server
- --kubelet-insecure-tls
- --kubelet-preferred-address-types=InternalIP


