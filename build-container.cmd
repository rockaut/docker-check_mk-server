set CMK_VERSION=%1

docker build . -t rockaut/check_mk-server:%CMK_VERSION%
