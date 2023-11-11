#!/bin/bash

# Install Apache
apt-get update
apt-get install -y apache2

# Create a sample webpage
echo "<html><head><title>Welcome to $(hostname)</title></head><body><h1>Hello, World!</h1><h2>This is the server named $(hostname)</h2><p>Enjoy your testing :)</p></body></html>" > /var/www/html/default.html
