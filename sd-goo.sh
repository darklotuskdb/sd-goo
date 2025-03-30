#!/bin/bash

# Display usage
usage() {
  echo "Usage: $0 -d <domain> -c <cookies>"
  echo "  -d  Domain to search (e.g., example.com)"
  echo "  -c  Cookies for the request (e.g., 'Cookie: __Secure-3PSID=val1; __Secure-3PSIDTS=val2')"
  exit 1
}

# Parse arguments
while getopts ":d:c:h" opt; do
  case $opt in
    d)
      tar=$OPTARG
      ;;
    c)
      cookies=$OPTARG
      ;;
    h)
      usage
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      usage
      ;;
  esac
done

# Check if both domain and cookies are provided
if [ -z "$tar" ] || [ -z "$cookies" ]; then
  echo "Error: Domain (-d) and Cookies (-c) are required."
  usage
fi

# Generate unique filename based on the domain
sfe=$(echo "$tar" | cut -d "." -f 1)

# Create temporary file to store search results
echo -n "+-www" > .gsd-tmp.txt

# Define runtime duration
runtime="40 second"
endtime=$(date -ud "$runtime" +%s)

# Start the loop until the runtime is exceeded
while [[ $(date -u +%s) -le $endtime ]]
do
  for gsd in $(cat .gsd-tmp.txt); do
    # Perform the Google search and capture the results
    g=$(curl "https://www.google.com/search?q=site:$tar$gsd" -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)' -H "$cookies" -s | \
        grep -Eoi '<a [^>]+>' | \
        grep -Eo 'href="[^\"]+"' | \
        grep -Eo '(http|https)://[^/"]+' | \
        grep -i "$tar" | \
        sort -u)

    # Process the results if the domain matches
    if echo "$g" | grep -i ".$tar" &> /dev/null; then
      echo "$g" | sed 's/https:\/\///g' | sed 's/http:\/\///g'
      echo "$g" | grep -v "https://$tar\|http://$tar" | cut -d '/' -f 3 | cut -d "." -f 1 | \
      sed 's/\<$sfe\>//g' | sed 's/^/+-/' | sort -u | tr -d '\n' >> .gsd-tmp1.txt
    else
      exit 1
    fi
  done < .gsd-tmp.txt

  # Update the temporary file with new search terms
  cat .gsd-tmp1.txt | tr '+-' '\n' | sort -u | sed 's/^/+-/' | tr -d '\n' > .gsd-tmp.txt
done

