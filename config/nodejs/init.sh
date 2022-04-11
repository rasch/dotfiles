# Install global node modules
yarn global add \
  marked \
  prettier \
  serve

# Clean up
yarn cache clean
rm -fr "$HOME"/.cache

# Set up Git to ignore `node_modules` directories.
mkdir -p "$HOME"/.config/git

cat << 'EOF' >> "$HOME"/.config/git/ignore
node_modules
EOF
