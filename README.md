# The Accountant

This little ruby application allows me to manage my account(s).
This is actually my very first program in Ruby. If you see any error, mistake or improvment, feel free to make a PR or an issue (with some explanation for me to understand what you did)

The batch file uses the warshield npm module to encrypt data.

If, by any chance, you wanna try it, the data.json file is encrypted. You need to create your own, here is its structure:
```json
{
    "acc_qtt": 3,
    "accounts": {
        "1": {
            "name": "accountName",
            "tx": 1,
            "txl": {
                "1": {
                    "libelle": "Some transaction name",
                    "value": "42",
                    "date": "08/12/2018"
                }
            }
        },
        "2": {
            "name": "LaccountName",
            "tx": 1,
            "txl": {
                "1": {
                    "libelle": "Origin",
                    "value": 456854,
                    "date": "08/12/2018"
                }
            }
        },
        "3": {
            "name": "accountName",
            "tx": 1,
            "txl": {
                "1": {
                    "libelle": "Origin",
                    "value": 6455.91,
                    "date": "08/12/2018"
                }
            }
        }
    }
}
```
