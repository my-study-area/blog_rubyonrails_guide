# Blog Ruby on Rails Guide
Estudo realizado com o [Rails Guide](https://guides.rubyonrails.org/getting_started.html#adding-some-validation) e utilizado como laboratório de estudos. Dentre os conhecimentos acrescentados estão: docker, docker-compose, TDD, BDD, cucumber, rspec, capybara e devise.

## Começando
### Configurando o ambiente de desenvolvimento
- clone o projeto:
```bash
git clone https://github.com/my-study-area/blog_rubyonrails_guide
```
- acesse o diretório do projeto:
```bash
cd blog_rubyonrails_guide/
```
- construa os containers:
```bash
docker-compose build
```
- crie o banco de dados e execute as migrations:
```bash
docker-compose run --rm app bundle exec rails db:create db:migrate
```
### Iniciando a aplicação
```bash
docker-compose up -d
```
Para acessar a aplicação acesse o endereço [http://localhost:3000/](http://localhost:3000/) em seu navegador.

- pare a aplicação:
```bash
docker-compose down
```
