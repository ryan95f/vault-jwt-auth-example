export JWT"$(python gen_token.py)
export VAULT_TOKEN="$(vault write -field=token auth/jwt/login role=test-role jwt=$JWT)"
vault kv get -mount=ryan -field=message my_super_secret