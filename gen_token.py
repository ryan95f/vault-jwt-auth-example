import jwt
import argparse
from datetime import timezone
from datetime import datetime


def load_private_key(filepath):
    with open(filepath, 'r') as file:
        return file.read()


def main():
    private_key = load_private_key('keys/jwtRS256.key')

    claims = {
        "message": "message",
        "branch": "hello",
        "exp": datetime.now(tz=timezone.utc) + 20
    }
    token = jwt.encode(claims, private_key, algorithm="RS256")
    print(token)

if __name__ == '__main__':
    main()
