#!/bin/bash

if [[ -z "$1" ]]; then
    echo "Usage:  $0  {ArticleTitle}"
    exit 1
fi

INPUT_TITLE="$1"

YEAR=2022

ARTICLE_TITLE_PATTERN="}${INPUT_TITLE}}"
TOC_PATH="_dist/tex-tmp/Shell_Beach_Book_$YEAR.toc"
PDF_PATH="_dist/$YEAR/Shell_Beach_Book_$YEAR.pdf"

START_PAGE_NOMINAL="$(grep "$ARTICLE_TITLE_PATTERN" "$TOC_PATH" | cut -d'{' -f5- | cut -d'}' -f1)"
START_PAGE_REAL="$((START_PAGE_NOMINAL+6))"

isLastArticle=n
if [[ ! -z "$(tail -n1 "$TOC_PATH" | grep -o "$ARTICLE_TITLE_PATTERN")" ]]; then
    # Is the last article
    isLastArticle=y
    TOTAL_PAGES="$(pdfpagescount "$PDF_PATH")"
    THIS_ARTICLE_END_PAGE="$((TOTAL_PAGES-1))"
else
    # Is not the last article
    # Not find the next article
    THIS_ARTICLE_TOC_LINE="$(grep -n "$ARTICLE_TITLE_PATTERN" "$TOC_PATH" | head -n1 | cut -d: -f1)"
    NEXT_ARTICLE_TOC_LINE="$((THIS_ARTICLE_TOC_LINE+1))"
    NEXT_ARTICLE_START_PAGE="$(head -n$NEXT_ARTICLE_TOC_LINE "$TOC_PATH" | tail -n1 | cut -d'{' -f5- | cut -d'}' -f1)"
    THIS_ARTICLE_END_PAGE="$((NEXT_ARTICLE_START_PAGE+6-1))"
    # echo "debug: NEXT_ARTICLE_START_PAGE=$NEXT_ARTICLE_START_PAGE"
fi
echo "[INFO] PDF range: $START_PAGE_REAL - $THIS_ARTICLE_END_PAGE"

RANGED_NAME="$INPUT_TITLE" pdfrange "$PDF_PATH" $START_PAGE_REAL-$THIS_ARTICLE_END_PAGE
