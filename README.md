
# Example of reading a secret with a JWT token

```bash
export JWT"$(python gen_token.py)
export VAULT_TOKEN="$(vault write -field=token auth/jwt/login role=test-role jwt=$JWT)"
vault kv get -mount=secrets -field=message production
```
