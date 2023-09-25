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
