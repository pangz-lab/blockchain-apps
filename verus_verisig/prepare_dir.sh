#!/bin/bash
BASE=lib
VIEW=view
SCREEN=$VIEW/screen
PATHS=(
    assets
    domain
    infrastructure
    $VIEW
    $VIEW/components
    $VIEW/controller
    $SCREEN $SCREEN/_main
    $SCREEN/desktop
    $SCREEN/mobile
    $SCREEN/web
)

for p in "${PATHS[@]}"
do
    echo "Creating path: $p"
    mkdir -p $BASE/$p
done
