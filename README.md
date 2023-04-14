
# TaskForce

Este projeto é uma aplicação web que permite ao usuário criar, gerenciar e rastrear tarefas e suas durações. O usuário pode se cadastrar e fazer login na aplicação, criar uma tarefa com uma quantidade e tempo de conclusão estimados, atualizar e excluir tarefas existentes e visualizar uma lista de tarefas com seus respectivos tempos de conclusão e quantidades. Além disso, a aplicação também calcula o tempo total de conclusão de todas as tarefas do usuário.

## Funcionalidades
A aplicação possui as seguintes funcionalidades:

* Autenticação de usuário: o usuário pode se cadastrar e fazer login na aplicação. As páginas de login e registro são protegidas por senha.
* Gerenciamento de tarefas: o usuário pode criar novas tarefas, atualizar e excluir tarefas existentes. As tarefas possuem campos para a quantidade e tempo de conclusão estimados.
* Lista de tarefas: o usuário pode visualizar uma lista de todas as tarefas criadas, juntamente com seus tempos de conclusão e quantidades.
* Cálculo do tempo total: a aplicação calcula automaticamente o tempo total de conclusão de todas as tarefas do usuário.
* Dados mensais: a aplicação também possui uma tabela de dados mensais que armazena o tempo total de conclusão de todas as tarefas para cada mês do ano.
* Tecnologias

### A aplicação foi construída usando as seguintes tecnologias:

* Ruby on Rails: uma estrutura de aplicativo da web escrita em Ruby.
* PostgreSQL: um sistema de gerenciamento de banco de dados relacional.
* Bootstrap: um conjunto de ferramentas de front-end para desenvolvimento web responsivo e móvel.

## Instalação
Para executar a aplicação localmente, você precisará ter o seguinte instalado em sua máquina:

* Ruby versão 2.7.4 ou superior
* Ruby on Rails versão 6.1.4 ou superior
* PostgreSQL versão 10.0 ou superior

### Para instalar as dependências do projeto, execute o seguinte comando no terminal:
* bundle install

### Como Usar
* Para iniciar a aplicação localmente, execute o seguinte comando no terminal:
    * rails server
    * Acesse a aplicação em seu navegador em http://localhost:3000.

### Autenticação de usuário
* Antes de usar a aplicação, é necessário criar uma conta de usuário. 
* Clique no botão "Registrar" na página inicial e preencha o formulário de registro.
* Após criar uma conta, você poderá fazer login na aplicação clicando no botão "Login" na página inicial. 
* Digite seu e-mail e senha para acessar a aplicação.

### Gerenciamento de tarefas
* Para criar uma nova tarefa, clique no botão "Nova Tarefa" na aba Tasks. 
* Preencha os campos de quantidade e tempo de conclusão estimados e clique em "Salvar".
