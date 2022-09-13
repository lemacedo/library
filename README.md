# Library API
API escrita em Ruby usando o framework Rails. Com a finalidade de cadastrar Autores e seus respectivos livros.


## Como executar

1. `docker compose build`
2. `docker compose up`
3. `docker exec rails db:setup`
4. acessar o endereço: [localhost:3000/api/v1/author](http://localhost:3000/api/v1/author)


## Swagger API

#### Para acessar a documentação no modelo Swagger/OpenAPI basta acessar o link: http://localhost:3000/api-docs/index.html

<img width="1480" alt="image" src="https://user-images.githubusercontent.com/4422834/189989364-5c1f1e41-5e77-44d3-bc21-51a44232e3be.png">

## Insomnia

#### Collections Insonmia

[LINK](https://gist.github.com/lemacedo/ce69a84e79ac5117da5113451a48eabb)

## Authentication
rodar o seguinte comando para gerar usuários para realizar a autenticação JWT:

`User.create!(email: 'usuario@jwt.com' , password: 'abc123' , password_confirmation: 'abc123')
`

E no endpoint: http://localhost:3000/authenticate
enviar os sequintes campos e valores:

`{
	"email": "example@mail.com",
	"password": "123123123"
}
`

Esse endpoint irá retornar o token JWT, o qual deve ser usado em todas as requisições.
Para tal, basta informar o header: 

`Authorization: <token_jwt>`

## Objetivos: 
- [x] API para gerenciar Livros
- [x] API para gerenciar Autores
- [x] Paginação
- [x] Autenticação
- [x] Teste unitários
- [x] Collection Insomnia
