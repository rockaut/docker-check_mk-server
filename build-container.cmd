set CMK_VERSION=%1
IF "%CMK_VERSION%"=="" (SET CMK_VERSION="1.2.8p17")
docker build . -t rockaut/check_mk-server:%CMK_VERSION%
