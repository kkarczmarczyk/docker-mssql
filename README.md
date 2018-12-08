# Docker-mssql
https://hub.docker.com/r/kkarczmarczyk/mssql/

Microsoft SQL Server docker image with .sql startup file, based on official microsoft/mssql-server image

## Supported tags and respective `Dockerfile` links

- [`latest` (*latest/Dockerfile*)](https://github.com/kkarczmarczyk/docker-mssql/blob/master/latest/Dockerfile) - the latest CU of the latest GA release

## Environment Variables


* `SA_PASSWORD` (*optional*) - is the database system administrator (userid = 'sa') password used to connect to SQL Server once the container is running. Important note: This password needs to include at least 8 characters of at least three of these four categories: uppercase letters, lowercase letters, numbers and non-alphanumeric symbols. (Default: `SuperSecret!`)

* `MSSQL_DB` database name (will be created at startup)
* `MSSQL_USER` username for MSSQL_DB
* `MSSQL_PASSWORD` password for MSSQL_USER

* `MSSQL_PID` (*optional*) - is the Product ID (PID) or Edition that the container will run with. Acceptable values:

    - **Developer** : This will run the container using the Developer Edition (this is the default if no MSSQL_PID environment variable is supplied)
    - **Express** : This will run the container using the Express Edition
    - **Standard** : This will run the container using the Standard Edition
    - **Enterprise** : This will run the container using the Enterprise Edition
    - **EnterpriseCore** : This will run the container using the Enterprise Edition Core
    
## Docker compose

This is an example `docker-compose.yaml` file:

```yaml
version: '2'
services:

  mssqldev:
    container_name: mssqldev
    image: kkarczmarczyk/mssql
    ports:
      - "1433:1433"
    environment:
      MSSQL_DB: devdb
      MSSQL_USER: dev
      MSSQL_PASSWORD: randompassword
    volumes:
    - ./{folder with query.sql file}:/usr/sql
```


Note: This image is inspired by [https://github.com/mcmoe/mssqldocker/blob/master/Dockerfile](https://github.com/mcmoe/mssqldocker/blob/master/Dockerfile)