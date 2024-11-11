#!/usr/bin/env bash

for d in `ls -d */`;
do
    ( stow --restow --adopt $d )
done
