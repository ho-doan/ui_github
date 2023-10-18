# update httpd.conf

    # AllowOverride controls what directives may be placed in .htaccess files.
    # It can be "All", "None", or any combination of the keywords:
    #   AllowOverride FileInfo AuthConfig Limit
    #
    AllowOverride All

- #LoadModule rewrite_module modules/mod_rewrite.so -> LoadModule rewrite_module modules/mod_rewrite.so

## restart server

- sudo service apache2 restart
