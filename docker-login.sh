#!/bin/bash
variables:
  REGISTRY_USER_DOCKER: "your_username"
  REGISTRY_PASS_DOCKER: "your_password"

before_script:
  - echo $REGISTRY_PASS_DOCKER | docker login -u $REGISTRY_USER_DOCKER --password-stdin