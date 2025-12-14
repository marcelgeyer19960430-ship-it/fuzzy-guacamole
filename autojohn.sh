#!/bin/bash
# Auto-crack script for John the Ripper in NetHunter

WORDLIST="/usr/share/wordlists/rockyou.txt"

if [ $# -eq 0 ]; then
  echo "Usage: $0 <file>"
  exit 1
fi

FILE=$1
EXT="${FILE##*.}"
HASHFILE="target.hash"

case "$EXT" in
  zip)
    zip2john "$FILE" > "$HASHFILE"
    ;;
  rar)
    rar2john "$FILE" > "$HASHFILE"
    ;;
  pdf)
    python3 /usr/share/john/pdf2john.py "$FILE" > "$HASHFILE"
    ;;
  docx|xlsx|pptx)
    python3 /usr/share/john/office2john.py "$FILE" > "$HASHFILE"
    ;;
  *)
    echo "Unsupported file type: $EXT"
    exit 1
    ;;
esac

john "$HASHFILE" --wordlist="$WORDLIST"
john --show "$HASHFILE"

