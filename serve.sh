#!/usr/bin/env bash
set -e

rm -rf ./public/*
hugo -D
nix-shell -p nodejs --run "npx pagefind --source public --bundle-dir ../static/_pagefind"
hugo server
