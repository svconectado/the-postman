# README

docker-compose build
docker-compse up -d

docker-compose exec app bundle exec rake db:create
docker-compose exec app bundle exec rake db:migrate
docker-compose exec app bundle exec rake db:seed

Url de prueba de webhook

http://localhost/svc/webhook/goes-ayuda-300-covid/123456

Explicacion

