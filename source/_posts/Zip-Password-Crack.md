---
title: Zip Password Crack
date: 2020-09-25 14:40:20
tags:
---


See [https://hashcat.net/forum/thread-7968.html](https://hashcat.net/forum/thread-7968.html)
`$zip2$*Ty*Mo*Ma*Sa*Va*Le*DF*Au*$/zip2$`
- Ty = type (0) and ignored.
- Mo = mode (1 2 3 for 128/192/256 bit)
- Ma = magic (file magic).  This is reservered for now.  See pkzip_fmt_plug.c or zip2john.c for information. For now, this must be a '0'
- Sa = salt(hex).   8, 12 or 16 bytes of salt (depends on mode)
- Va = Verification bytes(hex) (2 byte quick checker)
- Le = real compr len (hex) length of compressed/encrypted data (field DF)
- DF = compressed data DF can be Le*2 hex bytes, and if so, then it is the ENTIRE file blob written 'inline'. However, if the data blob is too long, then a .zip ZIPDATA_FILE_PTR_RECORD structure will be the 'contents' of DF
- Au = Authentication code (hex) a 10 byte hex value that is the hmac-sha1 of data over DF. This is the binary() value
- ZIPDATA_FILE_PTR_RECORD  (this can be the 'DF' of this above hash line). `*ZFILE*Fn*Oh*Ob*`  (Note, the leading and trailing * are the * that 'wrap' the DF object.
- ZFILE This is the literal string ZFILE
- Fn    This is the name of the .zip file.  NOTE the user will need to keep the .zip file in proper locations (same as was seen when running zip2john. If the file is removed, this hash line will no longer be valid.
- Oh    Offset to the zip central header record for this blob.
- Ob    Offset to the start of the blob data
