FROM postgres:12.2

# Specifying init file
COPY ./init/init.sql /docker-entrypoint-initdb.d/

# Setting postgres master password
ENV POSTGRES_PASSWORD "password"
EXPOSE 5434 5432