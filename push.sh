#!/data/data/com.termux/files/usr/bin/bash

# Start local preview server
echo "Starting local preview at http://localhost:8080 ..."
python3 -m http.server 8080 &
SERVER_PID=$!

# Wait for you to check the site
read -p "Press Enter to stop preview and push changes..."

# Stop the server
kill $SERVER_PID

# Stage all changes
git add -A

# Commit with timestamp
git commit -m "Update on $(date '+%Y-%m-%d %H:%M:%S')"

# Push to GitHub
git push -u origin main
