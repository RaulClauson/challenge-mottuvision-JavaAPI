# MottuVision - API de Gerenciamento de Motocicletas

[![Java](https://img.shields.io/badge/Java-17-orange.svg)](https://www.oracle.com/java/)
[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.5.4-brightgreen.svg)](https://spring.io/projects/spring-boot)
[![Oracle](https://img.shields.io/badge/Database-Oracle-red.svg)](https://www.oracle.com/database/)
[![Maven](https://img.shields.io/badge/Maven-3.9.11-blue.svg)](https://maven.apache.org/)

## 📖 Descrição

A **MottuVision** é uma API RESTful desenvolvida em Spring Boot para o gerenciamento completo de motocicletas em pátios. O sistema permite controlar o ciclo de vida das motocicletas desde a entrada até a finalização, incluindo controle de status, zonas, modelos, e geração de relatórios detalhados.

## 📋 Pré-requisitos

Antes de executar o projeto, certifique-se de ter instalado:

- **Java 17** ou superior
- **Maven 3.6+** ou use o wrapper incluído (`mvnw`)
- **Oracle Database** com as credenciais configuradas
- **IDE** de sua preferência (VS Code, IntelliJ, Eclipse)

## ⚙️ Configuração

### 1. Clone o repositório

```bash
git clone https://github.com/RaulClauson/challenge-mottuvision-JavaAPI.git
cd challenge-mottuvision-JavaAPI
```

### 2. Configure o banco de dados

Edite o arquivo `src/main/resources/application.properties`:

```properties
# Configuração do Oracle Database
spring.datasource.url=jdbc:oracle:thin:@oracle.fiap.com.br:1521:orcl
spring.datasource.username=SEU_USUARIO
spring.datasource.password=SUA_SENHA
spring.datasource.driver-class-name=oracle.jdbc.driver.OracleDriver
```

## 🚀 Como Executar

### Opção 1: Usando Maven Wrapper

```bash
# No Windows (PowerShell)
.\mvnw.cmd spring-boot:run

# No Linux/macOS
./mvnw spring-boot:run
```

### Opção 2: Usando Maven instalado

```bash
mvn spring-boot:run
```

### Opção 3: Executando o JAR

```bash
# Compilar o projeto
mvn clean package

# Executar o JAR gerado
java -jar target/crud-0.0.1-SNAPSHOT.jar
```

A aplicação estará disponível em: **http://localhost:8080**

Acesse a documentação interativa em: **http://localhost:8080/swagger-ui.html**

## 🚀 Funcionalidades

- **Gerenciamento de Motocicletas**: CRUD completo com identificadores únicos (PLACA, CHASSI, QRCODE)
- **Controle de Status**: Sistema hierárquico com grupos de status e status específicos
- **Organização por Zonas**: Controle geográfico das motocicletas nos pátios
- **Gerenciamento de Usuários**: Sistema de autenticação e autorização
- **Relatórios Avançados**: Dashboards com dados consolidados por status e zonas
- **Histórico de Finalizações**: Rastreamento de motocicletas finalizadas
- **Documentação Automática**: Swagger/OpenAPI integrado

## 🏗️ Arquitetura

O projeto segue os padrões do Spring Boot com arquitetura em camadas:

```
src/
├── main/
│   ├── java/com/mottuvision/crud/
│   │   ├── config/          # Configurações (OpenAPI)
│   │   ├── controller/      # Endpoints REST
│   │   ├── dto/            # Data Transfer Objects
│   │   ├── model/          # Entidades JPA
│   │   ├── repository/     # Repositórios Spring Data
│   │   └── service/        # Lógica de negócio
│   └── resources/
│       ├── application.properties  # Configurações da aplicação
│       ├── data.sql               # Dados iniciais
│       └── banner.txt             # Banner customizado
└── test/                   # Testes unitários
```

## 🛠️ Tecnologias Utilizadas

### Backend

- **Java 17** - Linguagem de programação
- **Spring Boot 3.5.4** - Framework principal
- **Spring Data JPA** - Persistência de dados
- **Spring Web** - APIs REST
- **Spring Validation** - Validação de dados

### Banco de Dados

- **Oracle Database** - Banco de dados principal
- **HikariCP** - Pool de conexões

### Documentação

- **SpringDoc OpenAPI 2.5.0** - Documentação automática da API

### Ferramentas

- **Lombok** - Redução de boilerplate
- **Maven 3.9.11** - Gerenciamento de dependências
- **Spring Boot DevTools** - Hot reload em desenvolvimento

## 🗃️ Modelo de Dados

### Entidades Principais

- **Moto**: Entidade central com identificador, modelo, zona, pátio, status
- **Identificador**: Valores únicos por tipo (PLACA, CHASSI, QRCODE)
- **Modelo**: Tipos de motocicletas (SPORT-ESD, SPORT, MOTTU-E, POP)
- **Status/StatusGrupo**: Sistema hierárquico de status
- **Zona**: Organização geográfica (Norte, Sul, Leste, Oeste)
- **Patio**: Locais físicos de armazenamento
- **Usuario**: Sistema de autenticação
- **PatioFinalizadas**: Histórico de motocicletas finalizadas

## 📚 Documentação da API

### Endpoints Principais

#### 🏍️ Motocicletas

- `GET /api/motos` - Lista todas as motocicletas
- `GET /api/motos/{id}` - Busca moto por ID
- `GET /api/motos/identificador/{valor}` - Busca por identificador
- `POST /api/motos` - Cria nova motocicleta
- `PUT /api/motos/{id}` - Atualiza motocicleta
- `DELETE /api/motos/{id}` - Remove motocicleta
- `POST /api/motos/{id}/finalizar` - Finaliza motocicleta (com histórico)

#### 👤 Usuários

- `GET /api/usuarios` - Lista usuários
- `POST /api/usuarios` - Cria usuário
- `POST /api/usuarios/login` - Autenticação

#### 📊 Relatórios

- `GET /api/relatorio` - Relatório completo com dados consolidados
- `GET /api/essenciais` - Dados essenciais (modelos, status, zonas)

#### 🏷️ Gerenciamento

- `GET /api/modelos` - Modelos de motocicletas
- `GET /api/status` - Status disponíveis
- `GET /api/status-grupos` - Grupos de status
- `GET /api/zonas` - Zonas disponíveis
- `GET /api/patios` - Pátios disponíveis

## 🧪 Dados de Teste

O sistema é inicializado com dados de exemplo através do arquivo `data.sql`:

### Usuário Padrão

- **Usuário**: `admin`
- **Senha**: `senha123`

### Dados Pré-carregados

- 4 Zonas (Norte, Sul, Leste, Oeste)
- 3 Pátios
- 4 Grupos de Status com 14 Status específicos
- 4 Modelos de motocicletas
- 30 Motocicletas de exemplo com fotos e observações

## 📋 Exemplos de Uso

### Criar uma nova motocicleta

```bash
curl -X POST http://localhost:8080/api/motos \
  -H "Content-Type: application/json" \
  -d '{
    "identificador": {
      "tipo": "PLACA",
      "valor": "ABC1D23"
    },
    "dataEntrada": "2025-09-01T17:22:27",
    "previsaoEntrega": "2025-09-02T12:00:00",
    "fotos": [
      "https://exemplo.com/foto1.jpg"
    ],
    "modelo": {"id": 1},
    "zona": {"id": 1},
    "patio": {"id": 1},
    "status": {"id": 1},
    "observacoes": [
      "Chegou com arranhões"
    ]
  }'
```

### Autenticar usuário

```bash
curl -X POST http://localhost:8080/api/usuarios/login \
  -H "Content-Type: application/json" \
  -d '{
    "usuario": "admin",
    "senha": "senha123"
  }'
```

### Obter relatório completo

```bash
curl -X GET http://localhost:8080/api/relatorio
```

## 🐛 Troubleshooting

### Problemas Comuns

1. **Erro de conexão com banco**

   - Verifique as credenciais no `application.properties`
   - Confirme se o Oracle Database está acessível

2. **Porta 8080 em uso**

   - Adicione `server.port=8081` no `application.properties`

3. **Problemas com Maven**

   - Use o wrapper incluído: `./mvnw` (Linux/macOS) ou `.\mvnw.cmd` (Windows)

4. **Logs para debugging**
   - Os logs SQL estão habilitados por padrão
   - Verifique o console para detalhes das operações

## 🧪 Testes

Execute os testes unitários:

```bash
# Usando Maven Wrapper
./mvnw test

# Usando Maven
mvn test
```

## 📦 Build para Produção

```bash
# Gerar JAR otimizado
mvn clean package -DskipTests

# O arquivo será gerado em: target/crud-0.0.1-SNAPSHOT.jar
```

## 🤝 Contribuição

1. Fork o projeto
2. Crie uma branch para sua feature (`git checkout -b feature/nova-funcionalidade`)
3. Commit suas mudanças (`git commit -am 'Adiciona nova funcionalidade'`)
4. Push para a branch (`git push origin feature/nova-funcionalidade`)
5. Abra um Pull Request

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo `LICENSE` para mais detalhes.

## 👥 Equipe

| Desenvolvedor  | LinkedIn                                               | GitHub                                               |     |
| -------------- | ------------------------------------------------------ | ---------------------------------------------------- | --- |
| Raul Clauson   | [LinkedIn](https://www.linkedin.com/in/raul-clauson/)  | [@raulclauson](https://github.com/raulclauson)       |     |
| Daniel Barros  | [LinkedIn](https://www.linkedin.com/in/danielbarros63) | [@danielbarros63](https://github.com/danielbarros63) |     |
| Luccas Alencar | [LinkedIn](https://www.linkedin.com/in/luccasalencar/) | [@luccasalencar](https://github.com/luccasalencar)   |     |

⭐ **Se este projeto foi útil para você, considere dar uma estrela no repositório!**
