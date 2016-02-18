#!/bin/bash

function fix_name() {
    echo $1 | cut -c 14- | grep -o -E '[a-z0-9]+' | head -n 1
}

function correct_gzip() {
    OUT=$(fix_name "$1")
    mkdir "$OUT"
    mv "$1" "$OUT/$OUT.tar.gz"
    pushd "$OUT"
    tar xzf "$OUT.tar.gz" > /dev/null
    rm "$OUT.tar.gz"
    popd
}

function correct_tar() {
    OUT=$(fix_name "$1")
    mkdir "$OUT"
    mv "$1" "$OUT/$OUT.tar"
    pushd "$OUT"
    tar xf "$OUT.tar" > /dev/null
    rm "$OUT.tar"
    popd
}

function correct_zip() {
    OUT=$(fix_name "$1")
    mkdir "$OUT"
    mv "$1" "$OUT/$OUT.zip"
    pushd "$OUT"
    unzip "$OUT.zip" > /dev/null
    rm "$OUT.zip"
    popd
}

mkdir assignments
cp $1 assignments
pushd assignments > /dev/null
unzip $1 > /dev/null
rm $1
for i in *; do
    case "$i" in
        *.txt) rm "$i" > /dev/null ;;
        *.tar) correct_tar "$i" > /dev/null ;;
        *.zip) correct_zip "$i" > /dev/null ;;
        *.tgz) correct_gzip "$i" > /dev/null ;;
        *.tar.gz) correct_gzip "$i" > /dev/null ;;
        *) echo "ERROR FOR SUBMISSION: $1" ;;
    esac
done
