# Högskolan i siffor
## App för granskning
Här borde det skrivas en beskrivning...

## För utvecklare
Glöm inte att göra en git pull innan nya publiceringar görs. README.md uppdateras av Github Actions CI Pipeline.

#### Makefile
För att underlätta hanteringen av taggar och releaser kan kommandot make användas.

**Exempel**
```shell
make publish
```
Detta kommer att lägga till all förändrade filer (git add) göra en commit, uppdatera versionen som en patch samt publicera den nya nya versionen till Github. 

**Alla kommandon**
```bash
# Create new patch version
make publish-patch
# Alias för patch version
make publish
# Create new minor version
make publish-minor
# Create new major version
make publish-major
# Build Docker image locally
make local_build
# Run Docker image locally
make run
# Update patch version only
make patch
# Update minor version only
make minor
# Update patch version only
make major

```

### Latest image:
```shell
docker pull ghcr.io/ukajohn/git_test:v1.0.0
```
