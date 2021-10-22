---
title: Hashcat
date: 2020-09-25 11:35:53
tags:
---
# Official Site
- https://hashcat.net/
- [hashcat-utils](https://github.com/hashcat/hashcat-utils/releases)
- [example hashes](https://hashcat.net/wiki/doku.php?id=example_hashes)

# Install
- NVIDIA GPUs require "NVIDIA Driver" (440.64 or later) and "CUDA Toolkit" (9.0 or later)

# Usage
- [doc](https://hashcat.net/wiki/doku.php?id=hashcat)
- `-a`
  - 0 | Straight
  - 1 | Combination
  - 3 | Brute-force(mask)
  - 6 | Hybrid Wordlist + Mask
  - 7 | Hybrid Mask + Wordlist
  - 9 | Association
- `-m`
  - see doc

# Examples
## guess a 10 digit pin and its sha-256 hash :`BCAB7BC1271648F17BCD97969ED526B29AC569835B482603378C9AB673ECF713`
- `hashcat.exe -a 3 -m 1400 BCAB7BC1271648F17BCD97969ED526B29AC569835B482603378C9AB673ECF713 ?d?d?d?d?d?d?d?d?d?d`

## 猜一串国际象棋棋盘位置
- 题目:类似A1B2..., 几个位置，不知道，但是可以组成图形，SHA-512: `76695A0407FD086391470B672B4A16208352DCF014C634D698C3062090ECDCE5E033C028B6AE10EDA2654855F126876ACA66743D4E0B5371140D9FCC6936A6C1`
- `hashcat.exe -a 3 -m 1700 -1 ABCDEFGH -2 12345678 76695A0407FD086391470B672B4A16208352DCF014C634D698C3062090ECDCE5E033C028B6AE10EDA2654855F126876ACA66743D4E0B5371140D9FCC6936A6C1 ?1?2?1?2?1?2?1?2?1?2`

## 猜美国运通卡卡号
- 题目:`2c59e74197a0558783111bdea47670bf1503f79d904108dec2db2dca7f2232f3` 末尾`8028`
- `hashcat -a 3 -m 1400 2c59e74197a0558783111bdea47670bf1503f79d904108dec2db2dca7f2232f3 34?d?d?d?d?d?d?d?d?d8028`
- `hashcat -a 3 -m 1400 2c59e74197a0558783111bdea47670bf1503f79d904108dec2db2dca7f2232f3 37?d?d?d?d?d?d?d?d?d8028`


## ntlm hash
- 题目:`8846F7EAEE8FB117AD06BDD830B7586C`
- `hashcat.exe -a 0 -m 1000  8846F7EAEE8FB117AD06BDD830B7586C    top1000.dict`

## Mysql
- 题目: He was a big fan of Game of Thrones because he threw away all his merch after season 8. crack mysql db: `b691e3dc40993ab6df870ce03ba2dfe021406df8`
- `cewl -w 1.txt -d 2 https://www.google.com/search?q=game+of+thrones`
- `cewl --proxy_host proxy.host --proxy_port 8080 https://www.hbo.com/game-of-thrones -w 2.txt -d 3`
- `hashcat.exe -a 0 -m 300  b691e3dc40993ab6df870ce03ba2dfe021406df8  3.txt`

## zip hash
- 题目:`$zip2$030f2424d6c3a08245a148c62c9f64544c102a1f34f6bbca756cdaed98435148cd041c3f57d220f2c008cc4da2b5c7dc329ed667e093bda9d6f2dbdba96a096e05a63b2823c47bbafc741ea70f839c1c6d1f8f3563027c172a48db9805988e198adb58775c90d4ae7ccf985758e1c4caf866d143ef6ce38257de0abaf0e106d5c3c41db0e5c9c5d79837836136e53bb460095b86b4fbbc1c4a7dbcbef14837d48a3b0b1ae23eb6dd39889a2d9abc92fbe01a068c2ba4f1fd2b0d0f80e233dfc13c9436ca6bc8b1363229d49c10f8a43c7378b0849e8024c37d041e87db47aa88194e9e414e6b3a868d188d9af3e97d0d727640d547553a09341caa92de2d3ada1f5adabe21ea8aab379c66835c6f4a3e1dd*$/zip2$` 密码由Color, Country, Fruit组成
- [zip hash 加星号](https://hashcat.net/forum/thread-7968.html)`$zip2$*0*3*0*f2424d6c3a08245a148c62c9f64544c1*2a1*f3*4f6bbca756cdaed98435148cd041c3f57d220f2c008cc4da2b5c7dc329ed667e093bda9d6f2dbdba96a096e05a63b2823c47bbafc741ea70f839c1c6d1f8f3563027c172a48db9805988e198adb58775c90d4ae7ccf985758e1c4caf866d143ef6ce38257de0abaf0e106d5c3c41db0e5c9c5d79837836136e53bb460095b86b4fbbc1c4a7dbcbef14837d48a3b0b1ae23eb6dd39889a2d9abc92fbe01a068c2ba4f1fd2b0d0f80e233dfc13c9436ca6bc8b1363229d49c10f8a43c7378b0849e8024c37d041e87db47aa88194e9e414e6b3a868d188d9af3e97d0d727640d547553a09341caa92de2d3ada1f5adabe21ea8aa*b379c66835c6f4a3e1dd*$/zip2$`
- `combinator3 color1.dict country1.dict fruit1.dict >all.dict`
- `hashcat.exe -a 0 -m 13600 a.hash   all.dict  --force`
- combine
  - hashcat -a 1 -m 0 example0.hash example.dict example.dict

## WPA
- 题目:We were monitoring the wifis from outside the building and were able to run a death attack to sniff a wpa 4-way handshake on reconnection. Cracking wpa is tediously slow and an only wordlist attack didn't work, So we are trying to apply rules and everyone is taking a part of it. Your part of the wordlist is attached. The robokracy guys are lacking creativity so choose your ruleset accordingly.
- `hashcat -m 2500 wpa.hccapx rockyou-short.txt -r rules/dive.rule`

## JWT
- `hashcat -a 0 -m 16500 eyJhbGciOiJIUzI1NiJ9.eyIzNDM2MzQyMCI6NTc2ODc1NDd9.f1nXZ3V_Hrr6ee-AFCTLaHRnrkiKmio2t3JqwL32guY example.dict`

## VeraCrypt
- `hashcat -a 0 -m 13752 container korea.txt --self-test-disable`

## MS word
- https://docs.microsoft.com/en-us/openspecs/office_file_formats/ms-offcrypto/9e61da63-8ddb-4c0a-b25d-f85d990f44c8
- `hashcat -a 3 -m 9600 -1 abcdefghijklmnopqrstuvwxyz0123456789 '$office$*2013*100000*256*16*9d3e8c8a1f9c2d786a867eba7241e947*5a8aa6d541a882bfac747a04f7b15854*308c5cd0640c7df5b5b6e8b03f221d481d29ea2b62025691d7870b5b4eb38bf7' '?1?1korea' --self-test-disable`
