# PostgreSQL PGroonga pgvector Image

Builds a PostgreSQL image with both
[PGroonga](https://pgroonga.github.io/) for multilingual full-text search and
[pgvector](https://github.com/pgvector/pgvector) for vector similarity search.
The image is application-independent.

## Image

```text
ghcr.io/mtaku3/postgres-pgroonga-pgvector:<git-commit-sha>
```

The tag is the complete Git commit SHA of this repository. No mutable `latest`
tag is published.

Included components:

- PostgreSQL 17
- PGroonga 4.0.8
- pgvector 0.8.6

The PGroonga base image is pinned by its multi-platform digest, and the
pgvector Debian package is pinned to its complete package version.

## Usage

Start PostgreSQL as usual, then enable the extensions in each database that
needs them:

```sql
CREATE EXTENSION IF NOT EXISTS pgroonga;
CREATE EXTENSION IF NOT EXISTS vector;
```

## Building

The [GitHub Actions workflow](.github/workflows/build.yml) builds for
`linux/amd64` and `linux/arm64`, publishes to GHCR, and generates provenance
and an SBOM. Pull requests build without publishing.

The component versions follow Hindsight's upstream
[PGroonga deployment recipe](https://github.com/vectorize-io/hindsight/tree/main/docker/docker-compose/pgroonga),
but neither the image nor its initialization is specific to Hindsight.

## Updating

1. Update the pinned PGroonga image tag and digest in `Dockerfile`.
2. Update the exact pgvector package version in `Dockerfile`.
3. Verify both extensions in a disposable PostgreSQL container.
4. Commit to `main` and update consumers to the new commit-SHA tag.

## License

MIT — see [LICENSE](LICENSE).
