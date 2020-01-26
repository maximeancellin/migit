# Migit
Script for Git migration.

Migit backup all git branches and tags.

## First

This script doesn't manage access on git server.
You must have authorization on source and target git server.

## How to use

The first argument is `URL` or `PATH` of the repository

```
./migit.sh {Actual git repository URL} {New git repository URL}
```

## More

If is a remote repository Migit use `/tmp` folder. After running Migit clean folder.
