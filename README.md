# ⟳ Automação de Testes - API BookStore

Projeto de automação de testes da API BookStore usando **Karate Framework**, desenvolvido como desafio técnico de QA.

---

## 📑 Sobre o Projeto

Este projeto é a produção de um suíte de testes automatizados de API REST da **BookStore API** ([https://bookstore.demoqa.com](https://bookstore.demoqa.com/)).
Os testes cobrem os principais endpoints de gerenciamento de usuários e livros.

### Endpoints Testados:

**Account:**

- ✅ `POST /Account/v1/User` - Criar usuário (sucesso + falha)
- ✅ `POST /Account/v1/GenerateToken` - Gerar token de autenticação
- ✅ `DELETE /Account/v1/User/{UUID}` - Deletar usuário

**BookStore:**

- ✅ `GET /BookStore/v1/Books` - Listar catálogo de livros
- ✅ `POST /BookStore/v1/Books` - Adicionar livro ao usuário
- ✅ `GET /BookStore/v1/Book` - Buscar livro por ISBN
- ✅ `PUT /BookStore/v1/Books/{ISBN}` - Atualizar ISBN do livro

---

## ⚙️ Tecnologias Utilizadas

- **Java 11+**
- **Maven 3.6+**
- **Karate Framework 1.4.1**
- **JUnit 5**

---

## 📋 Pré-requisitos

Antes de começar, certifique-se de ter instalado:

- [Java JDK 11+](https://www.oracle.com/java/technologies/downloads/) (https://www.oracle.com/java/technologies/downloads/#jdk21-windows)
- [Maven 3.6+](https://maven.apache.org/download.cgi) (https://maven.apache.org/download.cgi)

### Verificar Instalação:

```bash
java -version
# Saída esperada: java version "11.x.x" ou superior

mvn -version
# Saída esperada: Apache Maven 3.6.x ou superior

```

---

## 💻 Instalação

### 1. Clone o repositório ou baixe os arquivos do projeto:

```bash
git clone <https://github.com/seu-usuario/bookstore-karate-tests.git>
cd bookstore-karate-tests

```

---

## 📁 Estrutura do Projeto

```
myproject/
│
├── src/
│   └── test/
│       └── java/
│           ├── features/
│           │   ├── books/                    # Testes de livros
│           │   │   ├── adicionarLivro/
│           │   │   │   ├── adicionar-livro.feature
│           │   │   │   ├── adicionar-livro-invalido.json
│           │   │   │   └── adicionar-livro-sucesso.json
│           │   │   │
│           │   │   ├── alterarLivro/
│           │   │   │   ├── alterar-livro.feature
│           │   │   │   ├── alterar-livro-invalido.json
│           │   │   │   └── alterar-livro-sucesso.json
│           │   │   │
│           │   │   └── buscarLivros/
│           │   │       ├── buscar-isbn.feature
│           │   │       ├── buscar-livros.feature
│           │   │       └── buscar-livros.json
│           │   │
│           │   ├── gerarToken/
│           │   │   └── auth.feature          # Gerar token
│           │   │
│           │   ├── support/
│           │   │   └── Utils                 # Utilitários
│           │   │
│           │   └── users/                    # Testes de usuários
│           │       ├── criarUsuario/
│           │       │   ├── criar-usuario-sucesso.feature
│           │       │   ├── schema-usuario-erro.json
│           │       │   └── schema-usuario-sucesso.json
│           │       │
│           │       └── deletarUsuario/
│           │           ├── deletar-usuario.feature
│           │           └── schema-deletar-erro.json
│           │
│           ├── FeatureTest.java              # Runner de testes
│           ├── TestRunner.java               # Runner principal
│           ├── karate-config.js              # Configurações globais
│           └── logback-test.xml              # Configuração de logs
│
├── target/                                    # Gerado após build
├── .idea/                                     # Configurações do IDE
├── pom.xml                                    # Dependências Maven
└── README.md                                  # Documentação
```

---

## ▶️ Executando os Testes

### **Executar TODOS os testes:**

```bash
mvn clean test

```

---

### **Executar testes específicos:**

```bash
<div align="center">
  <video src="LINK_DO_SEU_VIDEO_AQUI" width="400" />
</div>

```

---

## 📊 Cenários de Teste

### **Account (Usuários):**

| Endpoint                                                               | Método    | Cenário                               | Status | Tag       |
| ---------------------------------------------------------------------- | --------- | ------------------------------------- | ------ | --------- |
| `/Account/v1/User`                                                     | POST      | Criar usuário válido                  | 201    | @positivo |
| `/Account/v1/User`                                                     | POST      | Criar usuário já cadastrado           | 400    | @negativo |
| `/Account/v1/GenerateToken`                                            | POST      | Gerar token válido                    | 200    | @positivo |
| `/Account/v1/GenerateToken`                                            | POST      | Gerar token com credenciais inválidas | 200    |
| `A API da BookStore informa que o status code para este cenário é 200` | @negativo |
| `/Account/v1/User/{UUID}`                                              | DELETE    | Deletar usuário existente             | 204    | @positivo |
| `/Account/v1/User/{UUID}`                                              | DELETE    | Deletar usuário sem token             | 401    | @negativo |

### **BookStore (Livros):**

| Endpoint                         | Método | Cenário                           | Status | Tag       |
| -------------------------------- | ------ | --------------------------------- | ------ | --------- |
| `/BookStore/v1/Books`            | GET    | Listar todos os livros            | 200    | @positivo |
| `/BookStore/v1/Books`            | POST   | Adicionar livro válido            | 201    | @positivo |
| `/BookStore/v1/Books`            | POST   | Adicionar livro sem autenticação  | 400    | @negativo |
| `/BookStore/v1/Book?ISBN={isbn}` | GET    | Buscar livro por isbn             | 200    | @positivo |
| `/BookStore/v1/Book?ISBN={isbn}` | GET    | Buscar livro com isbn inexistente | 400    | @negativo |
| `/BookStore/v1/Books/{ISBN}`     | PUT    | Atualizar ISBN válido             | 200    | @positivo |
| `/BookStore/v1/Books/{ISBN}`     | PUT    | Atualizar ISBN inválido           | 400    | @negativo |

---

## 📈 Relatórios

Após executar os testes, os relatórios são gerados automaticamente em:

```
target/karate-reports
```

---

## ⚙️ Variáveis de Ambiente

### **Configuração no `karate-config.js`:**

Este é o `karate-config.js`, o arquivo de configuração global do projeto. É aqui que definimos a variável que será utilizada como URL base em todas as features, a `baseUrl`:

```jsx
function fn() {
  var env = karate.env;

  var config = { env: env };
  config.baseUrl = "https://bookstore.demoqa.com";
  karate.log("karate.env system property was:", env);

  return config;
}
```

---

## ✨ Boas Práticas Implementadas

### ✅ **Organização:**

- Features separadas por responsabilidade (1 feature = 1 propósito)
- Nomenclatura clara e descritiva

### ✅ **Reutilização:**

- `auth.feature` para setup de autenticação (criar usuário + gerar token)
- `callonce` para reutilização de features
- Variáveis compartilhadas entre features

### ✅ **Independência:**

- Testes isolados e independentes
- Cada teste pode rodar sozinho
- Dados únicos (Java Faker) para evitar conflitos

### ✅ **Validações:**

- Status HTTP
- Schema de response
- Mensagens de erro
- Headers de autenticação

### ✅ **Tags:**

- `@positivo` - Cenários de sucesso
- `@negativo` - Cenários de falha

###

---

## 📚 Recursos Adicionais

- [Documentação Oficial do Karate](https://karatelabs.github.io/karate/)
- [API BookStore Swagger](https://bookstore.demoqa.com/swagger/)

---

## 👤 Autor

**[Vitor Lopes de Oliveira]**

- LinkedIn: [Vitor Oliveira](http://www.linkedin.com/in/vitorlopesoliveira)
- GitHub: [@vloliveira](https://github.com/vloliveira)
- Email: vitorloliveira96@gmail.com

---

## 📝 Licença

Este projeto foi desenvolvido para fins educacionais como parte de um desafio técnico.
