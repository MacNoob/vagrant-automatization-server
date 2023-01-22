#Набор команд для настройки виртуальной машины для запуска веб-приложения:
#Обновление apt:
sudo apt update
#Установка nodejs ver. 14.x.x:
curl -sL https://deb.nodesource.com/setup_14.x | sudo bash -
sudo apt install -y nodejs
#Установка postgresql:
sudo apt install -y  postgresql
#Установка make
sudo apt install make 
#Создание пользователя vagrant:
sudo -u postgres createuser --createdb vagrant
#Создание базы данных  для пользователя vagrant:
sudo -u postgres createdb --owner=vagrant vagrant
#Установка пароля для пользователя vagrant:
sudo -u postgres psql -c "ALTER USER vagrant WITH PASSWORD '1234';"
#Копирование и настройка git  репозитория:
cd /vagrant
git init
git clone https://github.com/hexlet-components/js-fastify-blog.git
cd js-fastify-blog && rm -rf .git
make setup
make start
