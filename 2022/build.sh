#!/bin/bash

REPODIR="$(realpath ..)"
REALPATH="$REPODIR/_dist/Shell_Beach_Book_2022.pdf"
XELATEXARGS=""
#####################################################################
### Parse arguments. Magic; do not touch.
POSITIONAL_ARGS=()
while [[ $# -gt 0 ]]; do
  case $1 in
    --png)
        TOIMG="png"
        shift # past argument
        ;;
    --jpg)
        TOIMG="jpg"
        shift # past argument
        ;;
    --oss)
        TONASOOS="y"
        shift # past argument
        ;;
    --range=*)
        PAGES_RANGE="${1/--range=/}"
        shift # past argument
        ;;
    -*|--*)
        echo "Unknown option $1"
        exit 1
        ;;
    *)
        POSITIONAL_ARGS+=("$1") # save positional arg
        shift # past argument
        ;;
  esac
done
set -- "${POSITIONAL_ARGS[@]}" # restore positional parameters
#####################################################################

### Preprocessors
### PP1: Pozhehao
sed -i "s|——|\\\\pozhehao{}|g" articles/*.tex

### Generate articles list
./getlist.sh > articles-list.tex


# mkdir -p "$REPODIR/_dist/tex-tmp"
# xelatex $XELATEXARGS \
#     -output-directory=$REPODIR/_dist/tex-tmp \
#     -shell-escape \
#     $REPODIR/2022/Shell_Beach_Book_2022.tex

# mv  $REPODIR/_dist/tex-tmp/*.pdf  $REPODIR/_dist/

# echo -e "\nDocument Size:"
# du -h "$REALPATH"
# PDFFN="$(basename "$REALPATH")"

# ### --oss
# if [[ $TONASOOS == y ]]; then
#     TMPFILE=/tmp/1ba5c9c8-9c1e-4b61-8c41-5df5c561abf8
#     echo -e "\nDocument URLs:"
#     OSS_SUBDIR=shellbeach/ saveFileToNasOSS "$REALPATH" -p > $TMPFILE
#     cat $TMPFILE
#     echo "$PDFFN  $(grep "oss.udon.pw:2096/p/" $TMPFILE)" >> .osslist
#     sort -u .osslist -o .osslist
#     rm $TMPFILE
# fi

# ### --range
# if [[ ! -z "$PAGES_RANGE" ]]; then
#     echo "Generating ranged subset."
#     RANGED_PDF_PATH="/tmp/${PDFFN/.pdf/}_page$PAGES_RANGE.pdf"
#     pdftk "$REALPATH" cat $PAGES_RANGE output "$RANGED_PDF_PATH"
#     du -h "$RANGED_PDF_PATH"
#     if [[ $TONASOOS == y ]]; then
#         OSS_SUBDIR=shellbeach-ranged/ saveFileToNasOSS "$RANGED_PDF_PATH"
#     fi
# fi
