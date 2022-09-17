#!/usr/bin/env bash
set -e

rm -rf ./public/*
hugo
nix-shell -p nodejs --run "npx pagefind --source public"
