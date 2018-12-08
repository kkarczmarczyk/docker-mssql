#!/bin/bash

/opt/mssql/bin/sqlservr & /usr/setup_db.sh

# Call extra command
eval $1