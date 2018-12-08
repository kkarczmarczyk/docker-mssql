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
 

## Additional startup .sql script

You can execute additional .sql file for database from outside of container at database startup. This container exposes volume `/usr/sql` - if you link this volume with local folder which contains `query.sql` file, queries inside file will be executed.
   
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

## Misc

This image is inspired by:
 - [https://github.com/mcmoe/mssqldocker/blob/master/Dockerfile](https://github.com/mcmoe/mssqldocker/blob/master/Dockerfile)
 - [https://github.com/Microsoft/sql-server-samples/tree/master/samples/containers/replication/db2](https://github.com/Microsoft/sql-server-samples/tree/master/samples/containers/replication/db2)
 - [https://github.com/twright-msft/mssql-node-docker-demo-app](https://github.com/twright-msft/mssql-node-docker-demo-app)

Note: By using this container, you accept SQL Server [EULA](https://go.microsoft.com/fwlink/?linkid=857698). Go to [https://hub.docker.com/r/microsoft/mssql-server/](https://hub.docker.com/r/microsoft/mssql-server/) for more details.