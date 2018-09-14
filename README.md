# OPENSHIFT S2I BUILDER IMAGES

This repository contains all OpenShift s2i builders that will help to speed up the deployment on OpenShift of both the backend Spring Boot microservices and the frontend Angular application.

## s2i-nfe-frontend

This folder contains all required files for creating the OpenShift s2i builder image for deploying the frontend Angular application.

## s2i-nfe-springboot-microservice

This folder contains all required files for creating the OpenShift s2i builder image for deploying each one of the backend Spring Boot microservices.

## scripts

This folder contains some scripts to automatize the s2i image builder and template creation

- Builder image creation sample:

    ```shell
        sh s2i-image-builder.bash ENVIRONMENT IMAGE_BUILDER_NAME
    ```
    > ENVIRONMENT value should be nfeuat or nfedesarrollo

    > IMAGE_BUILDER_NAME value should be s2i-nfe-springboot-microservice or s2i-nfe-frontend

- Template creation sample:

    ```shell
        sh s2i-template.bash ENVIRONMENT TEMPLATE_NAME
    ```
    > ENVIRONMENT value should be nfeuat or nfedesarrollo

    > TEMPLATE_NAME value should be s2i-nfe-springboot-microservice or s2i-nfe-frontend

## References

- https://github.com/openshift/source-to-image/tree/master/examples/nginx-centos7

- https://docs.openshift.com/container-platform/3.9/creating_images/s2i.html

- https://github.com/ganrad/openshift-s2i-springboot-java