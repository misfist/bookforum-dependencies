## Site Dependencies
Use these files to install all necessary themes and plugins.

### Requirements
- WordPress must be installed
- [Composer](https://getcomposer.org/) must be installed
   - `Dockerfile` contains commands to install

### Files Contained in Rep:
1. `composer.json`
2. `composer.lock`
3. `.env.example`
4. `auth.json.example`
5. `Dockerfile`
6. `readme.md`

## Steps to Install
- Put the files (without repo folder) in the root of your website folder
- Copy `.env.example` to a file called `.env`
   - Add license key to `ACF_PRO_KEY` property
- Copy `auth.json.example` to a file called `auth.json`
   - Add `username` and `password` credentials under `http-basic."composer.deliciousbrains.com"`
- Run `composer install` from the root folder

## Result
Once the process is complete, you should have new files in the following locations:


```
composer.lock
+- wp-content
    +- plugins
    +- themes
    +- vendor
```

## Using Docker Compose

Add this repository as a submodule of your project.

In your project's root directory, create a symbolic link to the docker-compose.yml file: `ln -s bookforum-dependencies/docker-compose.yml docker-compose.yml`.

Copy `.env.example` into the project's root directory as `.env` and set the variables.

Run `docker compose up`.

Install PHP dependencies with `docker compose exec wordpress /bin/bash -c "composer update && composer install"`.

Extract WordPress backup data to `bookforum-dependencies/wp-data`. (This directory is git-ignored.) The Docker image will look for uploads data in `wp-data/files/wp-content/uploads`.

Import database with `mysql -h 127.0.0.1 -P 3306 -u root -p wordpress < bookforum-dependencies/wp-data/{FILENAMEHERE}.sql`

Create an admin user with `
`docker compose run --rm wpcli user create yourname yourname@positiondev.com --role=administrator`.

Now you're ready to log in to WordPress at `http://localhost:8080`!!
