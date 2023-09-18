## Site Dependencies
Use these files to install all necessary themes and plugins.

### Files Contained in Rep:
1. `composer.json`
2. `.env.example`

## Steps to Install
- Put the files (without repo folder) in the root of your website folder
- Copy `.env.example` to a file called `.env`
- Add license key to `ACF_PRO_KEY` property
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