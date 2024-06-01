
# Alfred

**Alfred** é uma aplicação que utiliza o Dapper como ORM para acesso a banco de dados. Este projeto tem como objetivo demonstrar como configurar e usar o Dapper em uma aplicação .NET.

## Índice

- [Pré-requisitos](#pré-requisitos)
- [Instalação](#instalação)
- [Configuração](#configuração)
- [Uso](#uso)
- [Contribuição](#contribuição)
- [Licença](#licença)

## Pré-requisitos

Antes de começar, certifique-se de ter as seguintes ferramentas instaladas em sua máquina:

- [.NET 6.0 SDK](https://dotnet.microsoft.com/download/dotnet/6.0)
- [SQL Server](https://www.microsoft.com/pt-br/sql-server/sql-server-downloads) ou outro banco de dados compatível
- [Visual Studio](https://visualstudio.microsoft.com/) ou [Visual Studio Code](https://code.visualstudio.com/)

## Instalação

1. Clone o repositório:

   \`\`\`sh
   git clone https://github.com/seu-usuario/alfred.git
   cd alfred
   \`\`\`

2. Restaure as dependências do projeto:

   \`\`\`sh
   dotnet restore
   \`\`\`

3. Configure seu banco de dados (veja a seção [Configuração](#configuração) para mais detalhes).

## Configuração

### Banco de Dados

1. Crie um banco de dados no seu SQL Server (ou outro sistema de banco de dados).
2. Configure a string de conexão no arquivo \`appsettings.json\`:

   \`\`\`json
   {
     "ConnectionStrings": {
       "DefaultConnection": "Server=SEU_SERVIDOR;Database=SEU_BANCO_DE_DADOS;User Id=SEU_USUARIO;Password=SUA_SENHA;"
     }
   }
   \`\`\`

### Dapper

O Dapper é um micro ORM que facilita o acesso a banco de dados usando consultas SQL. Para instalar o Dapper, execute:

\`\`\`sh
dotnet add package Dapper
\`\`\`

## Uso

### Configuração Inicial

No seu arquivo \`Program.cs\` ou \`Startup.cs\`, configure a injeção de dependência do Dapper:

\`\`\`csharp
using System.Data;
using System.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllers();
builder.Services.AddScoped<IDbConnection>(sp => new SqlConnection(
    builder.Configuration.GetConnectionString("DefaultConnection")
));

var app = builder.Build();

// Configure the HTTP request pipeline.
app.UseAuthorization();
app.MapControllers();
app.Run();
\`\`\`

### Criando um Repositório

Crie um repositório para acessar os dados do banco de dados:

\`\`\`csharp
using Dapper;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

public interface IUserRepository
{
    Task<IEnumerable<User>> GetAllUsersAsync();
    Task<User> GetUserByIdAsync(int id);
}

public class UserRepository : IUserRepository
{
    private readonly IDbConnection _dbConnection;

    public UserRepository(IDbConnection dbConnection)
    {
        _dbConnection = dbConnection;
    }

    public async Task<IEnumerable<User>> GetAllUsersAsync()
    {
        var sql = "SELECT * FROM Users";
        return await _dbConnection.QueryAsync<User>(sql);
    }

    public async Task<User> GetUserByIdAsync(int id)
    {
        var sql = "SELECT * FROM Users WHERE Id = @Id";
        return await _dbConnection.QueryFirstOrDefaultAsync<User>(sql, new { Id = id });
    }
}
\`\`\`

### Controlador

Crie um controlador para expor endpoints de API:

\`\`\`csharp
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;

[ApiController]
[Route("[controller]")]
public class UsersController : ControllerBase
{
    private readonly IUserRepository _userRepository;

    public UsersController(IUserRepository userRepository)
    {
        _userRepository = userRepository;
    }

    [HttpGet]
    public async Task<IEnumerable<User>> Get()
    {
        return await _userRepository.GetAllUsersAsync();
    }

    [HttpGet("{id}")]
    public async Task<User> Get(int id)
    {
        return await _userRepository.GetUserByIdAsync(id);
    }
}
\`\`\`

## Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues e pull requests.

1. Faça um fork do projeto
2. Crie uma branch com sua feature (\`git checkout -b minha-feature\`)
3. Commite suas mudanças (\`git commit -m 'Adiciona minha feature'\`)
4. Faça um push para a branch (\`git push origin minha-feature\`)
5. Abra um Pull Request

## Licença

Este projeto está licenciado sob a Licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes." > README.md
# Alfred
![alt text](/public/alfred.png)

**Alfred** é uma aplicação que utiliza o Dapper como ORM para acesso a banco de dados. Este projeto tem como objetivo demonstrar como configurar e usar o Dapper em uma aplicação .NET.

## Índice

- [Pré-requisitos](#pré-requisitos)
- [Instalação](#instalação)
- [Configuração](#configuração)
- [Uso](#uso)
- [Contribuição](#contribuição)
- [Licença](#licença)

## Pré-requisitos

Antes de começar, certifique-se de ter as seguintes ferramentas instaladas em sua máquina:

- [.NET 8.0 SDK](https://dotnet.microsoft.com/download/dotnet/8.0)
- [MySql](https://www.mysql.com/downloads/) 
- [Visual Studio](https://visualstudio.microsoft.com/) ou [Visual Studio Code](https://code.visualstudio.com/)

## Instalação

1. Clone o repositório:

   \`\`\`sh
   git clone https://github.com/seu-usuario/alfred.git
   cd alfred
   \`\`\`

2. Restaure as dependências do projeto:

   \`\`\`sh
   dotnet restore
   \`\`\`

3. Configure seu banco de dados (veja a seção [Configuração](#configuração) para mais detalhes).

## Configuração

### Banco de Dados

1. Crie um banco de dados no seu SQL Server (ou outro sistema de banco de dados).
2. Configure a string de conexão no arquivo \`appsettings.json\`:

   \`\`\`json
   {
     "ConnectionStrings": {
       "DefaultConnection": "Server=SEU_SERVIDOR;Database=SEU_BANCO_DE_DADOS;User Id=SEU_USUARIO;Password=SUA_SENHA;"
     }
   }
   \`\`\`

### Dapper

O Dapper é um micro ORM que facilita o acesso a banco de dados usando consultas SQL. Para instalar o Dapper, execute:

\`\`\`sh
dotnet add package Dapper
\`\`\`

## Uso

### Configuração Inicial

No seu arquivo \`Program.cs\` ou \`Startup.cs\`, configure a injeção de dependência do Dapper:

\`\`\`csharp
using System.Data;
using System.Data.SqlClient;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllers();
builder.Services.AddScoped<IDbConnection>(sp => new SqlConnection(
    builder.Configuration.GetConnectionString("DefaultConnection")
));

var app = builder.Build();

// Configure the HTTP request pipeline.
app.UseAuthorization();
app.MapControllers();
app.Run();
\`\`\`

### Criando um Repositório

Crie um repositório para acessar os dados do banco de dados:

\`\`\`csharp
using Dapper;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;

public interface IUserRepository
{
    Task<IEnumerable<User>> GetAllUsersAsync();
    Task<User> GetUserByIdAsync(int id);
}

public class UserRepository : IUserRepository
{
    private readonly IDbConnection _dbConnection;

    public UserRepository(IDbConnection dbConnection)
    {
        _dbConnection = dbConnection;
    }

    public async Task<IEnumerable<User>> GetAllUsersAsync()
    {
        var sql = "SELECT * FROM Users";
        return await _dbConnection.QueryAsync<User>(sql);
    }

    public async Task<User> GetUserByIdAsync(int id)
    {
        var sql = "SELECT * FROM Users WHERE Id = @Id";
        return await _dbConnection.QueryFirstOrDefaultAsync<User>(sql, new { Id = id });
    }
}
\`\`\`

### Controlador

Crie um controlador para expor endpoints de API:

\`\`\`csharp
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;

[ApiController]
[Route("[controller]")]
public class UsersController : ControllerBase
{
    private readonly IUserRepository _userRepository;

    public UsersController(IUserRepository userRepository)
    {
        _userRepository = userRepository;
    }

    [HttpGet]
    public async Task<IEnumerable<User>> Get()
    {
        return await _userRepository.GetAllUsersAsync();
    }

    [HttpGet("{id}")]
    public async Task<User> Get(int id)
    {
        return await _userRepository.GetUserByIdAsync(id);
    }
}
\`\`\`

## Contribuição

Contribuições são bem-vindas! Sinta-se à vontade para abrir issues e pull requests.

1. Faça um fork do projeto
2. Crie uma branch com sua feature (\`git checkout -b minha-feature\`)
3. Commite suas mudanças (\`git commit -m 'Adiciona minha feature'\`)
4. Faça um push para a branch (\`git push origin minha-feature\`)
5. Abra um Pull Request

## Licença

Este projeto está licenciado sob a Licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes." > README.md
