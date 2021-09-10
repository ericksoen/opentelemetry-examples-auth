#!/bin/bash
cfssl genkey -initca ca-csr.json | cfssljson -bare ca
cfssl gencert -ca ca.pem -ca-key ca-key.pem cert-csr.json | cfssljson -bare cert