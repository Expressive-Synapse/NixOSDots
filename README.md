# README

## Introduction

---
This is a series of personal .nix files for the purpose of
configuring all my nixOS devices. This README is to go over
how it is organized.

## Flake

---
The flake file is used to delineate between which device to
apply the configuration for as well as to import nixOS modules
as needed.

## Hosts

---
All system configuration is performed within the hosts files.
Device specific organization is separated into their respective
folders. If two or more devices should require the same .nix file
a copy is to be made for each device. This is so that changes to 
one devices  configuration will not affect another.

## Users

---
All user specific configuration is performed within the users files.
This is all done with the help of the nixOS home-manager module.
Each user is given a folder with separate sets of .nix files for each
relevant system, along with a general folder for anything that should
be applied for the user on ALL devices. Each set of configurations should
have a home.nix that is called by home-manager from the configuration.nix
file of their respective hosts.

## Secrets

---
This folder is used to store encrypted files required for these configurations
to function properly. The encrypted files are designed to function with the 
sops-nix module. The key required to un-encrypt these files is intended to be
stored in a folder one layer outside of the NixOSDots folder called Keys. (ie ../Keys)
