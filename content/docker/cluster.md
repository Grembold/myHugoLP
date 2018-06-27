+++
title = "cluster"
description = "Cluster mit Raspberry Pi und Docker und Kubernets"
date = "2018-05-26"
draft = false
weight = 30
+++
# Cluster mit Raspberry Pi und Docker und Kubernets

* [admin magazin](http://www.admin-magazin.de/Das-Heft/2018/01/Cluster-mit-Raspberry-Pi-2 "Cluster mit Raspberry Pi")
* [Kubernetes Cluster mit kubeadm](https://gridscale.io/community/tutorials/kubernetes-cluster-mit-kubeadm/)

## Kubernetes Cluster installation and configuration 

pi auf neusten stand bringen:

    ::::ssh
    sudo apt-get update && sudo apt-get upgrade
    sudo apt-get install -y apt-transport-https curl


installationspaket für kubernetz herungerladen

    ::::
    # Repository GPG Key installieren
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

    # Kubernetes zu den Paketquellen hinzufügen
    echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/k8s.list

    # Paketquellen aktualisieren
    sudo apt-get update

    # Installation
    sudo apt-get install kubeadm kubelet kubernetes-cni

Nach der Installation wird das Kubernetes-Cluster initialisiert:

    # Cluster initiieren
    sudo kubeadm init --skip-preflight-checks --pod-network-cidr=10.10.0.0/16 --apiserver-advertise-address=192.168.178.4

{{% alert %}}

## Warnung

Leider habe ich die Installation abbrechen müssen, da ich die Fehlermeldung: `CGROUPS_MEMORY: missing` bekommen habe und nicht entfernen konnte.
{{% alert %}}

## Deinstallieren

So, ist mal wieder schief gegangen, also alles wieder runter vom System :-(

    :::
    sudo apt remove kubeadm kubelet kubernetes-cni
    sudo apt autoremove
    sudo rm /etc/apt/sources.list.d/k8s.list
    sudo apt-get clean && sudo apt update
