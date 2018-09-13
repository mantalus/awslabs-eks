SHELL := /bin/bash

ifdef BRANCH_NAME
	STACK_SUFFIX ?= $(if $(filter-out master,$(BRANCH_NAME)),-$(BRANCH_NAME))
else ifdef USER
	STACK_SUFFIX ?= -$(USER)
else ifdef USERNAME
	STACK_SUFFIX ?= -$(USERNAME)
endif

CFN_STACK_SUFFIX = $(STACK_SUFFIX)

ifeq ($(BRANCH_NAME), master)
	CFN_MAIN_STACK := true
endif

VPC_STACK_NAME        = eks-vpc$(STACK_SUFFIX)
EKS_IAM_STACK_NAME    = eks-iam$(STACK_SUFFIX)
EKS_STACK_NAME        = eks-cluster$(STACK_SUFFIX)
EKS_WORKER_STACK_NAME = eks-worker$(STACK_SUFFIX)

CURRENT_IP = $(shell curl -s checkip.amazonaws.com)/32

export

.PHONY: all deploy test clean

all:
	@$(MAKE) -f Makefile.test
	@$(MAKE) -f Makefile.deploy

deploy:
	@$(MAKE) -f Makefile.deploy

test:
	@$(MAKE) -f Makefile.test

clean:
	@$(MAKE) -f Makefile.clean

include Makefile.deploy
