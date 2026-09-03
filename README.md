# **2TERMO** 💻🚀

<div align="center">

### 📚 HTML • BACKEND • BANCO DE DADOS

**Aprendendo na prática como funciona o desenvolvimento de sistemas.**

</div>

---

# 🌐 HTML

## O que é HTML?

**HTML (HyperText Markup Language)** é utilizado para criar a estrutura de uma página Web.

Com HTML podemos criar:

- 📝 Textos
- 🔠 Títulos
- 🔘 Botões
- 📋 Formulários
- 🔗 Links
- 🖼️ Imagens
- 📦 Estruturas de páginas

### 💻 Exemplo de HTML

```html
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <title>2TERMO</title>
</head>

<body>

    <h1>Cadastro de Aluno</h1>

    <form action="/alunos" method="POST">

        <label>Nome:</label>
        <input type="text" name="nome">

        <br><br>

        <label>E-mail:</label>
        <input type="email" name="email">

        <br><br>

        <label>Curso:</label>
        <input type="text" name="curso">

        <br><br>

        <button type="submit">
            Cadastrar
        </button>

    </form>

</body>

</html>
```

Nesse exemplo, o HTML cria uma **tela de cadastro de alunos**.

O usuário preenche o nome, e-mail e curso e depois clica no botão **Cadastrar**.

---

# ⚙️ BACKEND

## O que é Backend?

O **Backend** é responsável por toda a parte que acontece por trás da aplicação.

Ele recebe os dados enviados pelo HTML, processa as informações e pode conversar com o Banco de Dados.

O Backend pode ser responsável por:

- 🔐 Login e autenticação
- 👤 Cadastro de usuários
- 📥 Receber informações
- 📤 Enviar informações
- 🧠 Regras de negócio
- 🗄️ Comunicação com o Banco de Dados
- 🔄 APIs
- 🔒 Segurança

Neste exemplo vamos utilizar **Node.js + Express**.

### 📦 Instalação

```bash
npm init -y
npm install express mysql2
```

### 💻 Exemplo de Backend

```javascript
const express = require("express");
const mysql = require("mysql2");

const app = express();

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

// Conexão com o Banco de Dados
const banco = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "1234",
    database: "2termo"
});

// Testando conexão
banco.connect((erro) => {

    if (erro) {
        console.log("Erro ao conectar ao banco!");
        return;
    }

    console.log("Banco de dados conectado!");
});

// Recebendo os dados do formulário HTML
app.post("/alunos", (req, res) => {

    const { nome, email, curso } = req.body;

    const sql = `
        INSERT INTO alunos (nome, email, curso)
        VALUES (?, ?, ?)
    `;

    banco.query(
        sql,
        [nome, email, curso],
        (erro) => {

            if (erro) {
                console.log(erro);
                return res.send("Erro ao cadastrar aluno!");
            }

            res.send("Aluno cadastrado com sucesso! 🎉");
        }
    );
});

// Iniciando o servidor
app.listen(3000, () => {

    console.log(
        "Servidor rodando em http://localhost:3000"
    );

});
```

### 🔎 O que esse Backend faz?

O processo funciona assim:

```text
👤 Usuário
     ↓
🌐 Formulário HTML
     ↓
⚙️ Backend Node.js
     ↓
🗄️ Banco de Dados
     ↓
✅ Dados armazenados
```

Quando o usuário envia o formulário, o **Backend recebe os dados** e envia essas informações para o **Banco de Dados**.

---

# 🗄️ BANCO DE DADOS

## O que é Banco de Dados?

O **Banco de Dados** é responsável por armazenar as informações da aplicação.

Neste exemplo vamos utilizar o **MySQL**.

Podemos armazenar informações como:

- 👤 Usuários
- 🎓 Alunos
- 📚 Cursos
- 📦 Produtos
- 🛒 Pedidos
- 💰 Pagamentos

### 🏗️ Criando o Banco de Dados

```sql
CREATE DATABASE `2termo`;

USE `2termo`;
```

### 📋 Criando uma tabela

```sql
CREATE TABLE alunos (

    id INT AUTO_INCREMENT PRIMARY KEY,

    nome VARCHAR(100) NOT NULL,

    email VARCHAR(150) NOT NULL,

    curso VARCHAR(100) NOT NULL

);
```

Agora temos uma tabela chamada `alunos`.

Ela possui:

| Campo | Tipo | Função |
|---|---|---|
| `id` | INT | Identificação do aluno |
| `nome` | VARCHAR | Nome do aluno |
| `email` | VARCHAR | E-mail do aluno |
| `curso` | VARCHAR | Curso do aluno |

---

# 🔄 OPERAÇÕES NO BANCO DE DADOS

## ➕ INSERT — Cadastrar

```sql
INSERT INTO alunos (nome, email, curso)
VALUES (
    'João',
    'joao@email.com',
    'Programação'
);
```

---

## 🔎 SELECT — Consultar

```sql
SELECT * FROM alunos;
```

Resultado:

```text
+----+------+------------------+-------------+
| id | nome | email            | curso       |
+----+------+------------------+-------------+
|  1 | João | joao@email.com   | Programação |
+----+------+------------------+-------------+
```

---

## ✏️ UPDATE — Atualizar

```sql
UPDATE alunos

SET curso = 'Desenvolvimento Web'

WHERE id = 1;
```

---

## 🗑️ DELETE — Excluir

```sql
DELETE FROM alunos

WHERE id = 1;
```

---

# 🔥 CRUD

As principais operações de um Banco de Dados são conhecidas como **CRUD**:

```text
C → CREATE → Criar
R → READ   → Ler
U → UPDATE → Atualizar
D → DELETE → Excluir
```

### Exemplo:

```text
➕ CREATE
Cadastrar um aluno

🔎 READ
Consultar um aluno

✏️ UPDATE
Alterar os dados de um aluno

🗑️ DELETE
Excluir um aluno
```

---

# 🔗 HTML + BACKEND + BANCO DE DADOS

Agora podemos juntar tudo:

```text
                  👤 USUÁRIO
                      │
                      ▼
               🌐 HTML / FRONTEND
                      │
                Envia os dados
                      │
                      ▼
               ⚙️ BACKEND
              Node.js + Express
                      │
                Processa os dados
                      │
                      ▼
               🗄️ MYSQL
                      │
               Armazena os dados
                      │
                      ▼
               ⚙️ BACKEND
                      │
                Retorna resposta
                      │
                      ▼
               🌐 HTML
                      │
                      ▼
              ✅ Usuário recebe
                 o resultado
```

---

# 🚀 EXEMPLO COMPLETO

### 1️⃣ HTML envia:

```text
Nome: João
E-mail: joao@email.com
Curso: Programação
```

### 2️⃣ Backend recebe:

```javascript
const { nome, email, curso } = req.body;
```

### 3️⃣ Backend envia para o MySQL:

```sql
INSERT INTO alunos (nome, email, curso)
VALUES (?, ?, ?);
```

### 4️⃣ MySQL armazena:

```text
ID:     1
Nome:   João
E-mail: joao@email.com
Curso:  Programação
```

### 5️⃣ Backend responde:

```text
✅ Aluno cadastrado com sucesso!
```

---

# 📚 RESUMO

| Área | Tecnologia | Função |
|---|---|---|
| 🌐 Frontend | HTML | Cria a estrutura da página |
| ⚙️ Backend | Node.js + Express | Processa os dados |
| 🗄️ Banco de Dados | MySQL | Armazena os dados |

---

<div align="center">

# **💻 2TERMO 🚀**

### 🌐 HTML + ⚙️ BACKEND + 🗄️ BANCO DE DADOS

**Aprender • Praticar • Criar • Evoluir**

⭐ **Cada linha de código é um passo a mais no aprendizado.**

</div>
