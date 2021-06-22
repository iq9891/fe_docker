if [ -d ./www/.yarn ]; then rm -rf ${result_path}www/.yarn; fi
if [ -f ./www/.yarnrc ]; then rm ${result_path}www/.yarnrc; fi
if [ -f .env ]; then rm ${result_path}.env; fi
if [ -f docker-compose.yml ]; then rm ${result_path}docker-compose.yml; fi


# 如果存在就复制
if [ ! -f ".env.sample .env" ];then
  sysOS=`uname -s`
  if [ $sysOS == "Darwin" ];then
    cp .env.sample .env
    cp docker-compose.sample.yml docker-compose.yml
  else
    copy .env.sample .env
    copy docker-compose.sample.yml docker-compose.yml
  fi
fi

docker-compose up -d
