>- - -
> *WARNING: this container isn't intended for production use!*
>
> *Particularly data persistance isn't guaranteed. (currently)*
>- - -

# check_mk-server
Dockerized check_mk server without modifications

## Build Args
- CMK_VERSION -- Default = 1.2.8p17 -- Sets the used Check_MK version in the Dockerfile.
- sitename -- Default = cmk -- Used as the sites name.

## Exposed ports
- 5000 for HTTP

## Volumes
- /opt/omd/sites/${sitename}/local -- additional checks/bin etc.
- /opt/omd/sites/${sitename}/etc/check_mk -- config files for cmk/wato

You may also just use `-v volumename:/opt/omd/sites/${sitename}` to map the whole check_mk site folder.
