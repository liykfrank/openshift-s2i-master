#!/bin/bash

oc project $1

oc delete template $2

oc create -f ../$2/$2.json