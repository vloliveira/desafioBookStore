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

### 2. Instale as dependências:

```bash
mvn clean install -DskipTests

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

### **Executar feature ESPECÍFICA:**

### Testes de Account:

```bash
mvn test -Dkarate.options="classpath:features/account/criar-usuario-sucesso.feature"

```

### Testes de BookStore:

```bash
mvn test -Dkarate.options="classpath:features/bookstore/listar-livros-sucesso.feature"

```

---

### **Executar com AMBIENTE específico:**

```bash
# Ambiente de desenvolvimento
mvn test -Dkarate.env=dev

# Ambiente de QA
mvn test -Dkarate.env=qa

# Ambiente de produção
mvn test -Dkarate.env=prod

```

---

### **Executar em PARALELO:**

```bash
mvn test -Dkarate.options="--threads 5"

```

---

## 📊 Cenários de Teste

### **Account (Usuários):**

| Endpoint                    | Método | Cenário                               | Status | Tag       |
| --------------------------- | ------ | ------------------------------------- | ------ | --------- |
| `/Account/v1/User`          | POST   | Criar usuário válido                  | 201    | @positivo |
| `/Account/v1/User`          | POST   | Criar usuário duplicado               | 406    | @negativo |
| `/Account/v1/GenerateToken` | POST   | Gerar token válido                    | 200    | @positivo |
| `/Account/v1/GenerateToken` | POST   | Gerar token com credenciais inválidas | 400    | @negativo |
| `/Account/v1/User/{UUID}`   | DELETE | Deletar usuário existente             | 204    | @positivo |
| `/Account/v1/User/{UUID}`   | DELETE | Deletar usuário inexistente           | 200    | @negativo |

### **BookStore (Livros):**

| Endpoint                         | Método | Cenário                          | Status | Tag       |
| -------------------------------- | ------ | -------------------------------- | ------ | --------- |
| `/BookStore/v1/Books`            | GET    | Listar todos os livros           | 200    | @positivo |
| `/BookStore/v1/Books`            | POST   | Adicionar livro válido           | 201    | @positivo |
| `/BookStore/v1/Books`            | POST   | Adicionar livro sem autenticação | 401    | @negativo |
| `/BookStore/v1/Book?ISBN={isbn}` | GET    | Buscar livro existente           | 200    | @positivo |
| `/BookStore/v1/Book?ISBN={isbn}` | GET    | Buscar livro inexistente         | 400    | @negativo |
| `/BookStore/v1/Books/{ISBN}`     | PUT    | Atualizar ISBN válido            | 200    | @positivo |
| `/BookStore/v1/Books/{ISBN}`     | PUT    | Atualizar ISBN inválido          | 400    | @negativo |

---

## 📈 Relatórios

Após executar os testes, os relatórios são gerados automaticamente em:

```
target/karate-reports/
├── karate-summary.html      # Relatório resumido
└── karate-timeline.html     # Timeline de execução

```

### **Abrir Relatório:**

### No Windows:

```bash
start target/karate-reports/karate-summary.html

```

### No Mac/Linux:

```bash
open target/karate-reports/karate-summary.html
```

---

## ⚙️ Variáveis de Ambiente

### **Configuração no `karate-config.js`:**

```jsx
MODIFICAR MODIFICAR MODIFICAR

function fn() {
    var env = karate.env || 'dev';  // Padrão: dev

    var config = {
        env: env,
        baseUrl: "<https://bookstore.demoqa.com>",

        testUser: {
            userName: 'testuser_' + new Date().getTime(),  // Username único
            password: 'Test@1234'
        }
    };

    return config;
}

```

### **Ambientes Disponíveis:**

| Ambiente | Comando                      | Descrição                |
| -------- | ---------------------------- | ------------------------ |
| `dev`    | `mvn test -Dkarate.env=dev`  | Desenvolvimento (padrão) |
| `qa`     | `mvn test -Dkarate.env=qa`   | Homologação/QA           |
| `prod`   | `mvn test -Dkarate.env=prod` | Produção                 |

### **Propriedades Configuráveis:**

- `baseUrl`: URL da API
- `testUser.userName`: Template de username para testes
- `testUser.password`: Senha padrão para testes
- `timeout`: Timeout de requisições (padrão: 10000ms)

---

## ✨ Boas Práticas Implementadas

### ✅ **Organização:**

- Features separadas por responsabilidade (1 feature = 1 propósito)
- Nomenclatura clara e descritiva
- Estrutura escalável

### ✅ **Reutilização:**

- `auth.feature` para setup de autenticação (criar usuário + gerar token)
- `callonce` para executar setup apenas 1 vez
- Variáveis compartilhadas entre features

### ✅ **Independência:**

- Testes isolados e independentes
- Cada teste pode rodar sozinho
- Dados únicos (timestamp) para evitar conflitos

### ✅ **Validações:**

- Status HTTP
- Schema de response
- Mensagens de erro
- Headers de autenticação

### ✅ **Tags:**

- `@smoke` - Testes essenciais
- `@positivo` - Cenários de sucesso
- `@negativo` - Cenários de falha
- `@account` / `@bookstore` - Por módulo

### ✅ **Documentação:**

- README completo
- Comentários nos testes
- Logs detalhados para debug

---

## 📌 Casos de Uso

### **Cenário 1: Smoke Test Rápido**

```bash
mvn test -Dkarate.options="--tags @smoke"

```

### **Cenário 2: Validar Apenas Sucessos**

```bash
mvn test -Dkarate.options="--tags @positivo"

```

### **Cenário 3: Validar Apenas Falhas**

```bash
mvn test -Dkarate.options="--tags @negativo"

```

### **Cenário 4: Teste Completo com Relatório**

```bash
mvn clean test
start target/karate-reports/karate-summary.html

```

---

## 🐛 Troubleshooting

### **Problema: "Failed to execute goal"**

**Solução:**

```bash
mvn clean install -DskipTests
mvn test

```

### **Problema: "Connection timeout"**

**Solução:** Aumente o timeout no `karate-config.js`:

```jsx
karate.configure("connectTimeout", 30000);
karate.configure("readTimeout", 30000);
```

### **Problema: "User exists"**

**Solução:** O username deve ser único. Verifique se está usando timestamp:

```gherkin
"userName": "Usuario_" + new Date().getTime()

```

### **Problema: Relatório não abre**

**Solução:** Execute os testes primeiro:

```bash
mvn clean test

```

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

---

## 🎯 Diferenciais Implementados

- ✅ Cobertura dos 2 métodos GET (Books e Book)
- ✅ Uso de `Scenario Outline` para múltiplos casos de teste
- ✅ Validação de schema básico
- ✅ Uso de `callonce` para otimização
- ✅ Testes de sucesso E falha para cada endpoint
- ✅ Estrutura profissional e escalável

---

**Desenvolvido com Karate Framework**
