#!/bin/sh

gcloud container clusters resize $CLUSTER_NAME --size=0
