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

# Add HTML header, CSS styles, and footer
sed -i -e '1i\<html>\n<head>\n<title>Blog</title>\n<style>\nbody {\n  font-family: sans-serif;\n  margin: 0;\n  padding: 0;\n}\nh1 {\n  color: #333;\n  font-size: 2em;\n  margin: 1em 0 0.5em;\n}\np {\n  color: #333;\n  font-size: 1em;\n  margin: 1em 0;\n}\n</style>\n</head>\n<body>' $output_file
echo '</body>\n</html>' >> $output_file

echo "Generated HTML blog: $output_file"

