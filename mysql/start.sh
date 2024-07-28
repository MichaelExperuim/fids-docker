#!/bin/bash

/entrypoint.sh

/init-db.sh

# Keep the container running
tail -f /dev/null