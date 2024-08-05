---
title: Json Schema
date: 2024-03-13 14:48:06
tags:
---
# Doc
- https://json-schema.org/understanding-json-schema/structuring
- https://datatracker.ietf.org/doc/html/draft-handrews-relative-json-pointer-01
- https://json-schema.apifox.cn/

# online tool
- https://www.lddgo.net/string/json-schema

# Example
- Schema
```json
{
    "$id": "https://example.com/schemas/customer",
    "$schema": "https://json-schema.org/draft/2019-09/schema",
    "type": "object",
    "properties": {
        "first_name": {
            "type": "string"
        },
        "last_name": {
            "type": "string"
        },
        "shipping_address": {
            "$ref": "/schemas/address"
        },
        "billing_address": {
            "$ref": "/schemas/address"
        }
    },
    "required": [
        "first_name",
        "last_name",
        "shipping_address",
        "billing_address"
    ],
    "definitions": {
        "state": {
            "enum": [
                "CA",
                "NY",
                "... etc ..."
            ]
        }
    },
    "$defs": {
        "address": {
            "$id": "/schemas/address",
            "$schema": "http://json-schema.org/draft-07/schema#",
            "type": "object",
            "properties": {
                "street_address": {
                    "type": "string"
                },
                "city": {
                     "$ref": "#/definitions/city"
                },
                "state": {
                    "$ref": "/schemas/customer#/definitions/state"
                }
            },
            "required": [
                "street_address",
                "city",
                "state"
            ],
            "definitions": {
                "city": {
                    "enum": [
                        "Shanghai",
                        "Beijing",
                        "... etc ..."
                    ]
                }
            }
        }
    }
}
```

- Data
```json
{
    "first_name": "a",
    "last_name": "a",
    "shipping_address": {
        "street_address": "bbb",
        "city": "Shanghai",
        "state": "CA"
    },
    "billing_address": {
        "street_address": "aaa",
        "city": "Shanghai",
        "state": "CA"
    }
}
```

