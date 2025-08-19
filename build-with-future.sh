#!/bin/bash

# Build Jekyll site with future posts enabled
echo "Building site with future posts enabled..."
bundle exec jekyll build --future

echo "Build complete! Future posts are included."
echo "Check _site/ directory for the built files."
