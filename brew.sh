#!/bin/bash

# Start by updating brew
brew update && brew upgrade

# Taps
brew tap \
    vladimirvivien/oss-tools \
    hashicorp/tap

# Kube
echo "Installing Kube tools..."
brew install \
    ktop \
    kubectx \
    helm \
    kubeseal \
    derailed/k9s/k9s \
    kustomize \
    colima

# Terraform
echo "Installing Terraform tools..."
brew install \
    warrensbox/tap/tfswitch \
    hashicorp/tap/terraform \
    terragrunt \
    hclfmt

# Shell
echo "Installing Shell tools..."
brew install \
    findutils \
    bash-completion@2 \
    jandedobbeleer/oh-my-posh/oh-my-posh

brew install gnu-sed --with-default-names

# CLI Tools
echo "Installing CLI tools..."
brew install \
    gh \
    watch \
    jq \
    grep \
    telnet \
    wget \
    pre-commit \
    mitmproxy

# Data
echo "Installing Kafka tools..."
brew install \
    kcat \
    duckdb

# Python
echo "Installing Python tools..."
brew install \
    pyenv \
    uv \
    pipx

# Java
echo "Installing Java tools..."
brew install \
    gradle
brew install --cask \
    visualvm

# Go
echo "Installing Go tools..."
brew install golangci-lint

# Serialization
echo "Installing Serialization formats..."
brew install \
    protobuf \
    bufbuild/buf/buf \
    avro-tools
