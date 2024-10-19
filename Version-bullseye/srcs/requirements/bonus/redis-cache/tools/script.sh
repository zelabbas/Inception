#!/bin/bash

# Bind to all available network interfaces
# that means the redice can accepet any connection from any ip address
sed -i 's/bind 127.0.0.1/bind 0.0.0.0/g' /etc/redis/redis.conf

# maxmemory: By setting a memory limit, you ensure that Redis only uses a predefined amount of memory for caching, 
# allowing you to balance resources between Redis and other services (like your database or web server).
# Once the memory limit is reached, Redis needs to decide which data to remove to make space for new entries. This decision is governed by the maxmemory-policy.
# maxmemory-policy: 
# Purpose: To determine which keys to remove to free up memory for new data, ensuring that Redis continues to operate within the specified memory constraints.
# allkeys: Applies the eviction policy to all keys in the database, regardless of whether they have an expiration set
# lru: Stands for Least Recently Used. This part of the policy targets keys that haven't been accessed recently.
echo "maxmemory 550mb" >> /etc/redis/redis.conf && echo "maxmemory-policy allkeys-lru" >> /etc/redis/redis.conf

# start Redis , Redis will accept connection from any host
exec redis-server --protected-mode no
