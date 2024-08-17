#!/bin/bash
set -e
echo "Checking application availability"
if curl --fail http://13.60.2.166:31448; then
    echo "Application is reachable!"
else
    echo "Application is not reachable"
    exit 1
fi

echo "Test completed"
