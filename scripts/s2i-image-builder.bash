#!/bin/bash

oc project $1

oc delete imagestream $2

oc delete bc $2

BRANCH=""
if [ $1 = "nfeuat" ]; then
    echo pulling UAT branch
    BRANCH="#UAT"
fi        

oc new-build --strategy=docker --name=$2 --context-dir="$2" http://gitlab.nfedev.accelya.com/bsplink/openshift-s2i.git$BRANCH