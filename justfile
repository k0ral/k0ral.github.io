build:
  rm -rf ./public/*
  hugo
  nix-shell -p nodejs --run "npx pagefind --source public"

serve:
  rm -rf ./public/*
  hugo -D
  nix-shell -p nodejs --run "npx pagefind --source public --bundle-dir ../static/_pagefind"
  hugo server -D
