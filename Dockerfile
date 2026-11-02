# PostgreSQL with PGroonga for multilingual full-text search and pgvector for
# vector similarity search. The versions match Hindsight's upstream PGroonga
# deployment recipe, but the resulting image is application-independent.
FROM groonga/pgroonga:4.1.0-debian-17@sha256:81ba507e55904b1d847c332353cbb2a8aba88ac5e1e464cb314ee7c5381ba7f0

# renovate: datasource=deb depName=postgresql-17-pgvector registryUrl=https://apt.postgresql.org/pub/repos/apt?suite=trixie-pgdg&components=main&binaryArch=amd64
ARG PGVECTOR_VERSION=0.8.6-1.pgdg13+1

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
      postgresql-17-pgvector=${PGVECTOR_VERSION} \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

LABEL org.opencontainers.image.source="https://github.com/mtaku3/postgres-pgroonga-pgvector-image" \
      org.opencontainers.image.description="PostgreSQL 17 with PGroonga and pgvector" \
      org.opencontainers.image.licenses="MIT"
