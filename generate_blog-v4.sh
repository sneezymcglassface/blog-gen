#!/bin/bash

# Check if input file is specified
if [ -z "$1" ]; then
  echo 'Error: no input file specified.' >&2
  exit 1
fi

# Set output file name
output_file=${1%.*}.html

# Generate HTML from Markdown
markdown $1 > $output_file

# Add HTML header and footer
sed -i -e '1i\<html>\n<head>\n<title>Blog</title>\n<link rel="stylesheet" href="style2-dark.css">\n</head>\n<body>' $output_file
echo '</body>\n</html>' >> $output_file

echo "Generated HTML blog: $output_file"

