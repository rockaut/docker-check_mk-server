>- - -
> *WARNING: this container isn't intended for production use!*
>
> *Particularly data persistance isn't guaranteed. (currently)*
>- - -

# check_mk-server
Dockerized check_mk server without modifications but some addaptions

Pull it also on https://hub.docker.com/r/rockaut/check_mk-server/ ( rockaut/check_mk-server)

## Build Args
- CMK_VERSION -- Default = 1.2.8p18 -- Sets the used Check_MK version in the Dockerfile.
- sitename -- Default = cmk -- Used as the sites name.

## Exposed ports
- 5000 for HTTP

## Volumes
- /opt/omd/sites/${sitename}/local -- additional checks/bin etc.
- /opt/omd/sites/${sitename}/etc/check_mk -- config files for cmk/wato

You may also just use `-v volumename:/opt/omd/sites/${sitename}` to map the whole check_mk site folder.

- - -

## Branches and Tags
- develop = default branch, bigger changes first pushed to this one
- master = branch for standard releases ( :latest Docker-Tag )
- beta-innovation = used for beta or innovation releases of Check_MK
- Git Tags are used for Docker-Tags and will be automaticly pulled and build on Docker-Hub

## Known Issues
- TMPFS currently disabled (doesn't work with default docker container settings)

## TODOs
- enable TMPFS if container is priviledged
- implement entrypoint.sh for some startup checks
