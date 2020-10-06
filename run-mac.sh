if [ -f .env ]; then rm ${result_path}.env; fi
if [ -f docker-compose.yml ]; then rm ${result_path}docker-compose.yml; fi

cp .env.sample .env
cp docker-compose.sample.yml docker-compose.yml

docker-compose up -d
