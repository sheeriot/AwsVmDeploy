#!/bin/bash
# Normalize ENV Variables from Pipeline and Pipeline Variables
# v0.1

export INFRA_NAME=awsvmhost
export TF_VAR_infra_name=$(echo "${INFRA_NAME}" | tr '[:upper:]' '[:lower:]')

# ---------------

echo "Setting up variables for ENV_NAME: ${ENV_NAME}"
export TF_VAR_env_name=$(echo "${ENV_NAME}" | tr '[:upper:]' '[:lower:]')
export ENV_NAME_LOWER=$(echo "${ENV_NAME}" | tr '[:upper:]' '[:lower:]')
echo TF_VAR_env_name: ${TF_VAR_env_name}

declare AWS_ACCESS_KEY_ID_VAR=${ENV_NAME}_AWS_ACCESS_KEY_ID
export AWS_ACCESS_KEY_ID=${!AWS_ACCESS_KEY_ID_VAR}
echo AWS_ACCESS_KEY_ID: ${AWS_ACCESS_KEY_ID}

declare AWS_SECRET_ACCESS_KEY_VAR=${ENV_NAME}_AWS_SECRET_ACCESS_KEY
export AWS_SECRET_ACCESS_KEY=${!AWS_SECRET_ACCESS_KEY_VAR}
echo AWS_SECRET_ACCESS_KEY: ${AWS_SECRET_ACCESS_KEY}

declare AWS_REGION_VAR=${ENV_NAME}_AWS_REGION
export AWS_REGION=${!AWS_REGION_VAR}
echo AWS_REGION: ${AWS_REGION}
export TF_VAR_aws_region=$AWS_REGION

declare STATE_SUFFIX_VAR=${ENV_NAME}_STATE_SUFFIX
STATE_SUFFIX=$(echo "${!STATE_SUFFIX_VAR}" | tr '[:upper:]' '[:lower:]')
export TFSTATE_BUCKETNAME="${INFRA_NAME}-${TF_VAR_env_name}-${STATE_SUFFIX}"
echo TFSTATE_BUCKETNAME: "${TFSTATE_BUCKETNAME}"
export TF_VAR_tfstate_bucketname="${TFSTATE_BUCKETNAME}"

declare CIDR_BLOCK_VAR=${ENV_NAME}_CIDR_BLOCK
CIDR_BLOCK=$(echo "${!CIDR_BLOCK_VAR}" | tr -d '[:space:]')
export TF_VAR_cidr_block="${CIDR_BLOCK}"
echo TF_VAR_cidr_block: ${TF_VAR_cidr_block}

OPS_IP1=$(echo "${OPS_IP1}" | tr -d '[:space:]')
export TF_VAR_ops_ip1="${OPS_IP1}"
echo TF_VAR_ops_ip1: ${TF_VAR_ops_ip1}

export TF_VAR_pubkey1="${PUBKEY1}"
echo TF_VAR_pubkey1: ${TF_VAR_pubkey1}

# check for provided VM_SIZE
if [ -n "${VM_SIZE}" ]; then
    VM_SIZE=$(echo "${VM_SIZE}" | tr -d '[:space:]')
    export TF_VAR_vm_size="${VM_SIZE}"
fi
echo TF_VAR_vm_size: ${TF_VAR_vm_size}
