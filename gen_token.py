import jwt
import argparse
from datetime import timezone
from datetime import datetime
from datetime import timedelta


def load_private_key(filepath):
    with open(filepath, 'r') as file:
        return file.read()


def main():
    private_key = load_private_key('keys/jwtRS256.key')

    iat = datetime.now(tz=timezone.utc)
    claims = {
        "message": "message",
        "branch": "main",
        "iat": iat,
        "exp": iat + timedelta(hours=1),
        "nbf": iat
    }
    token = jwt.encode(claims, private_key, algorithm="RS256")
    print(token)

if __name__ == '__main__':
    main()
