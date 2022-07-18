# Vault JWT Auth Example

An example of using JWT to authenticate with Vault using public and private keys

## Requirements

The project requires the following dependencies to run the example:

* Python 3.7 or above
* Vault CLI
* Terraform
* Docker
* Git Bash (**For Windows only**)

## Set Up

First create the public and private keys that will be used to generate and validate JWT tokens:

To create the private key first run:

```bash
ssh-keygen -t rsa -b 4096 -m PEM -f keys/jwtRS256.key
```

Then generate the public key:

```bash
openssl rsa -in keys/jwtRS256.key -pubout -outform PEM -out keys/jwtRS256.key.pub
```

Then create the Python virtual for the `gen_token.py` script.

```bash
python -m venv env
```

Activate the virtual environment:

```bash
source env/bin/activate

./env/Scripts/activate
```

Install the requirements:

```bash
python -r requirements.txt
```

## Creating the Vault instance with Docker

To create the vault instance:

```bash
docker compose up -d
```

This will create a single instance of Vault using the official Vault image. The instance can be accessed on `localhost:8200`

## Deploying the Terraform

To deploy the Terraform, first create a plan:

```bash
make init
```

Then apply the plan:

```bash
make apply
```

## Example of reading a secret with a JWT token

```bash
export JWT="$(python gen_token.py)"
export VAULT_TOKEN="$(vault write -field=token auth/jwt/login role=production jwt=$JWT)"
vault kv get -mount=secrets -field=message production
```
