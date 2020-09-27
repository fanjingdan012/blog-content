---
title: Windows Zip Hash
date: 2020-09-18 10:49:09
tags:
---


# Structure
- see [https://hashcat.net/forum/thread-7968.html](https://hashcat.net/forum/thread-7968.html)
- `$zip2$*Ty*Mo*Ma*Sa*Va*Le*DF*Au*$/zip2$`
- Ty = type (0) and ignored.
- Mo = mode (1 2 3 for 128/192/256 bit)
- Ma = magic (file magic).  This is reservered for now.  See pkzip_fmt_plug.c or zip2john.c for information. For now, this must be a '0'
- Sa = salt(hex).   8, 12 or 16 bytes of salt (depends on mode)
- Va = Verification bytes(hex) (2 byte quick checker)
- Le = real compr len (hex) length of compressed/encrypted data (field DF)
- DF = compressed data DF can be Le*2 hex bytes, and if so, then it is the ENTIRE file blob written 'inline'. However, if the data blob is too long, then a .zip ZIPDATA_FILE_PTR_RECORD structure will be the 'contents' of DF
- Au = Authentication code (hex) a 10 byte hex value that is the hmac-sha1 of data over DF. This is the binary() value
- ZIPDATA_FILE_PTR_RECORD  (this can be the 'DF' of this above hash line).
- *ZFILE*Fn*Oh*Ob*  (Note, the leading and trailing * are the * that 'wrap' the DF object.
- ZFILE This is the literal string ZFILE
- Fn    This is the name of the .zip file.  NOTE the user will need to keep the .zip file in proper locations (same as  was seen when running zip2john. If the file is removed, this hash line will no longer be valid.
- Oh    Offset to the zip central header record for this blob.
- Ob    Offset to the start of the blob data

# example
- a CTF challenge, need to split the zip hash with `*`: `$zip2$030f2424d6c3a08245a148c62c9f64544c102a1f34f6bbca756cdaed98435148cd041c3f57d220f2c008cc4da2b5c7dc329ed667e093bda9d6f2dbdba96a096e05a63b2823c47bbafc741ea70f839c1c6d1f8f3563027c172a48db9805988e198adb58775c90d4ae7ccf985758e1c4caf866d143ef6ce38257de0abaf0e106d5c3c41db0e5c9c5d79837836136e53bb460095b86b4fbbc1c4a7dbcbef14837d48a3b0b1ae23eb6dd39889a2d9abc92fbe01a068c2ba4f1fd2b0d0f80e233dfc13c9436ca6bc8b1363229d49c10f8a43c7378b0849e8024c37d041e87db47aa88194e9e414e6b3a868d188d9af3e97d0d727640d547553a09341caa92de2d3ada1f5adabe21ea8aab379c66835c6f4a3e1dd*$/zip2$`
- result: `$zip2$*0*3*0*f2424d6c3a08245a148c62c9f64544c1*02a1*f3*4f6bbca756cdaed98435148cd041c3f57d220f2c008cc4da2b5c7dc329ed667e093bda9d6f2dbdba96a096e05a63b2823c47bbafc741ea70f839c1c6d1f8f3563027c172a48db9805988e198adb58775c90d4ae7ccf985758e1c4caf866d143ef6ce38257de0abaf0e106d5c3c41db0e5c9c5d79837836136e53bb460095b86b4fbbc1c4a7dbcbef14837d48a3b0b1ae23eb6dd39889a2d9abc92fbe01a068c2ba4f1fd2b0d0f80e233dfc13c9436ca6bc8b1363229d49c10f8a43c7378b0849e8024c37d041e87db47aa88194e9e414e6b3a868d188d9af3e97d0d727640d547553a09341caa92de2d3ada1f5adabe21ea8aa*b379c66835c6f4a3e1dd*$/zip2$`
- official example: `$zip2$*0*3*0*b5d2b7bf57ad5e86a55c400509c672bd*d218*0**ca3d736d03a34165cfa9*$/zip2$`

# cracking with hashcat
- `hashcat.exe -a 0 -m 13600 a.hash   all.dict  --force`
