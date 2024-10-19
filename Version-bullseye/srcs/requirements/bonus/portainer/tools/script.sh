#!/bin/bash

# Start Portainer in the background
/usr/local/bin/portainer/portainer &

# Save the PID of the Portainer process
PORTAINER_PID=$!

# Give Portainer some time to start
sleep 10 

# Initialize the admin user
curl -s -H "Content-Type: application/json" \
    -d "{\"Username\":\"$username\",\"Password\":\"$password\"}" \
    -X POST http://localhost:9000/api/users/admin/init > /dev/null

# Bring Portainer back to the foreground
wait $PORTAINER_PID