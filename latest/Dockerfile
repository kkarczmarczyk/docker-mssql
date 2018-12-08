FROM mcr.microsoft.com/mssql/server:latest

RUN mkdir -p /usr
WORKDIR /usr
COPY . /usr

VOLUME /usr/sql

RUN chmod +x /usr/setup_db.sh
RUN chmod +x /usr/entrypoint.sh

ENV ACCEPT_EULA Y
ENV SA_PASSWORD SuperSecret!

EXPOSE 1433

ENTRYPOINT ["./entrypoint.sh"]

# Tail the setup logs to trap the process
CMD ["tail -f /dev/null"]

HEALTHCHECK --interval=15s CMD /opt/mssql-tools/bin/sqlcmd -U sa -P $SA_PASSWORD -Q "select 1" && grep -q "MSSQL CONFIG COMPLETE" ./config.log
