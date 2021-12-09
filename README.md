<h1 align="center">CHEF CHALLENGE BACKEND</h1>

_A northen star project._

Prove and improve your cooking abilities.

___

**Version :** 0.0.1

**Technos :** Hasura, Graphql, Docker

**Author :** Anatole de Chauveron

**Licence :** All rights reserved
___

##  Getting started

### Requirements

You must have a running version of hasura-console, Docker and docker-compose on your local machine.

```bash
❯ hasura version
INFO hasura cli is up to date                      version=2.0.9
INFO hasura cli                                    version=v2.0.9

❯ docker version
Client: Docker Engine - Community
  Version:           20.10.11

❯ docker-compose version
docker-compose version 1.25.0
```

### Make migrations

When you are making some changes on the database (adding or updating tables or datas), run the following commands migrate those changes on the repository.

```bash
# First create the migration
hasura migrate create "migration_name" --from-server --database-name <database-name>

# This command will print a version number keep it, otherwise, this number will be added to the migration folder name

# To apply it to the server
hasura migrate apply --version "<version>" --skip-execution --database-name <database-name>
```

## Contact

_For further informations, contact the owner of this repository at this email :  **adechauveron@gmail.com**._