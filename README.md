# Vault JWT Auth Example

An example of using JWT tokens to authenticate with Vault using public and private keys to fetch secrets.

## Requirements

The project requires the following dependencies to run the example:

### Required

* Python 3.7 or above
* Vault CLI
* Terraform
* Git Bash - **For Windows only**

### Optional

* Docker - *alternatively you can run the local instance that comes with the Vault CLI*

## Set Up

A pair of public and private keys will be required to generate and validate the JWT tokens:

First create the directory to store the keys:

```bash
mkdir keys
```

To create the private key first run:

```bash
ssh-keygen -t rsa -b 4096 -m PEM -f keys/jwtRS256.key
```

Then generate the public key:

```bash
openssl rsa -in keys/jwtRS256.key -pubout -outform PEM -out keys/jwtRS256.key.pub
```

Create the Python virtual environment for the `gen_token.py` script:

```bash
python -m venv env
```

Activate the virtual environment:

```bash
source env/bin/activate # For MacOS & Linux

./env/Scripts/activate # For Windows
```

Install the requirements for the Python script:

```bash
python -r requirements.txt
```

## Creating the Vault instance with Docker

To create the Vault instance:

```bash
docker compose up -d
```

This will create a single instance of the Vault container that is called `vault` using the official image. The instance can be accessed on `localhost:8200`

### Fetching the root key from the Vault container

To fetch the root key from Vault from the logs, run:

```bash
docker logs vault
```

You will then seen a token called `Root Token:`. Copy the value of the token and place this in a variable called `VAULT_TOKEN` within your prompt.

```bash
export VAULT_TOKEN=<vault-token>
```

## Deploying the Terraform

To deploy the Terraform, first create a plan:

```bash
make plan
```

Then apply the plan:

```bash
make apply
```

If no errors were raised when deploying the Terraform, then this has successfully created all the demo backend roles and secrets.

## Reading secrets with JWT and Vault

### Authenticate with Vault

First call the Python script called `gen_token.py`. This will generate a JWT token using the private key. Then place the output into a variable called `JWT`:

```bash
export JWT="$(python gen_token.py)"
```

**Note**: By default the Python script will only generate a token for the following claims:

```json
{
    "branch": "main"
}
```

If you want to experiment with the development secret, then update the script to change the branch to `dev`.

Once the JWT token has been saved, you can authenticate with Vault with the following command:

```bash
export VAULT_TOKEN="$(vault write -field=token auth/jwt/login role=<role-name> jwt=$JWT)"
```

**Note**: Replace `<role-name>` with the name of the backend role. For example, this repository will create a backend auth role called `production`.

## Reading a secret

This example uses the key value secrets engine to store 2 example secrets in a mount called `secrets`. To read from the mount:

```bash
vault kv get -mount=secrets -field=message <secret-name>
```

**Note**: Replace `<secret-name>` with the name of one of the secrets. For example, this repository will create a secret called `production`.
