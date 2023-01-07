#!/bin/bash

# Check if pandoc is installed
if ! [ -x "$(command -v pandoc)" ]; then
  echo 'Error: pandoc is not installed.' >&2
  exit 1
fi

# Check if input file is specified
if [ -z "$1" ]; then
  echo 'Error: no input file specified.' >&2
  exit 1
fi

# Set output file name
output_file=${1%.*}.html

# Generate HTML from Markdown using pandoc
pandoc $1 -o $output_file

# Add HTML header and footer
sed -i -e '1i\<html>\n<head>\n<title>Blog</title>\n</head>\n<body>' $output_file
echo '</body>\n</html>' >> $output_file

echo "Generated HTML blog: $output_file"
