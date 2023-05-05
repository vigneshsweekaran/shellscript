#!/bin/bash

cat << EOF >> openssl.cnf
[req]
default_bits = 4096
default_md = sha256
default_keyfile = privkey.pem
distinguished_name = req_distinguished_name
attributes = req_attributes
x509_extensions = v3_ca # The extensions to add to the self signed cert
[req_attributes]
[req_distinguished_name]
countryName = US
countryName_min = 2
countryName_max = 2
stateOrProvinceName = Singapore
localityName = Singapore
0.organizationName = devopspilot
organizationalUnitName = Devops
commonName = certificate-authority
commonName_max = 64
emailAddress = vigneshsweekaran@gmail.com
emailAddress_max = 64
[ v3_ca ]
subjectKeyIdentifier=hash
authorityKeyIdentifier=keyid:always,issuer
basicConstraints = critical,CA:true
[ req_ext ]
subjectAltName = DNS:localhost
EOF

# CA
openssl req -new -nodes -text -out ca.csr -keyout ca-key.pem -subj "/CN=certificate-authority" -addext "subjectAltName = DNS:localhost"
openssl x509 -req -in ca.csr -text -extfile openssl.cnf -extensions v3_ca -signkey ca-key.pem -out ca-cert.pem

# Server certificate - Rabbitmq
openssl req -new -nodes -text -out server.csr -keyout server-key.pem -subj "/CN=localhost" -addext "subjectAltName = DNS:localhost"
openssl x509 -req -in server.csr -text -extfile openssl.cnf -extensions v3_ca -CA ca-cert.pem -CAkey ca-key.pem -CAcreateserial -out server-cert.pem
openssl req -new -nodes -text -out client.csr -keyout client-key.pem -subj "/CN=localhost" -addext "subjectAltName = DNS:localhost"

# Client certificate - xray
openssl req -new -nodes -text -out client.csr -keyout client-key.pem -subj "/CN=localhost" -addext "subjectAltName = DNS:localhost"
openssl x509 -req -in client.csr -text -extfile openssl.cnf -extensions v3_ca -CA ca-cert.pem -CAkey ca-key.pem -CAcreateserial -out client-cert.pem
