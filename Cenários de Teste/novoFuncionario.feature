Funcionalidade: Adição de Funcionários no Gestor de Funcionários

  Contexto:
    Como um usuário do SEA Tecnologia
    Eu quero adicionar novos funcionários ao sistema
    Para que eu possa manter um registro atualizado da equipe

  Cenário: Adicionar novo funcionário
    Dado que estou na página de adição de funcionário
    Quando preencho o campo "O trabalhador está ativo ou inativo" com "Ativo"
    E preencho os campos obrigatórios:
      | Campo               | Valor          |
      | Nome                | faker          |
      | Sexo                | Masculino      |
      | CPF                 | faker          |
      | Data de nascimento  | 01/01/1990     |
      | RG                  | faker          |
      | Cargo               | Cargo 04       |
    E seleciono os EPIs:
      | Atividade           | EPI                   | Número do CA |
      | Atividade 02        | Capacete de Segurança | faker        |
    E anexo um atestado de saúde ocupacional (Opcional)
    E clico no botão "Salvar"
    Então o funcionário faker é adicionado com sucesso
    E sou redirecionado para a tela inicial onde a lista de funcionários inclui faker

  Cenário: Adicionar múltiplos EPIs para o mesmo funcionário
    Dado que estou na página de adição de funcionário
    Quando preencho o campo "O trabalhador está ativo ou inativo" com "Ativo"
    E preencho os campos obrigatórios:
      | Campo               | Valor          |
      | Nome                | faker          |
      | Sexo                | Masculino      |
      | CPF                 | faker          |
      | Data de nascimento  | 01/01/1990     |
      | RG                  | faker          |
      | Cargo               | Cargo 04       |
    E seleciono os seguintes EPIs:
      | Atividade           | EPI                   | Número do CA |
      | Atividade 02        | Capacete de Segurança | faker        |
    E clico no botão "Adicionar EPI"
    Então vou conseguir preencher outro EPI
      | Atividade 03        | Óculos de Proteção    | faker        |
    E anexo um atestado de saúde ocupacional
    E clico no botão "Salvar"
    Então o funcionário faker é adicionado com sucesso
    E sou redirecionado para a tela inicial onde a lista de funcionários inclui faker

    Cenário: Excluir EPI adicionada
    Dado que estou na página de adição de funcionário
    Quando preencho o campo "O trabalhador está ativo ou inativo" com "Ativo"
    E preencho os campos obrigatórios:
      | Campo               | Valor          |
      | Nome                | faker          |
      | Sexo                | Masculino      |
      | CPF                 | faker          |
      | Data de nascimento  | 01/01/1990     |
      | RG                  | faker          |
      | Cargo               | Cargo 04       |
    E seleciono os seguintes EPIs:
      | Atividade           | EPI                   | Número do CA |
      | Atividade 02        | Capacete de Segurança | faker        |
    E clico no botão "Adicionar EPI"
    Então vou conseguir preencher outro EPI
      | Atividade 03        | Óculos de Proteção    | faker        |
    E clico no botão "Adicionar EPI"
    E clico no botão de "Excluir EPI"
    Então o EPI adicionado é removido.

    Cenário: Adicionar funcionario selecionando "O trabalhador não usa EPI"
    Dado que estou na página de adição de funcionário
    Quando preencho o campo "O trabalhador está ativo ou inativo" com "Ativo"
    E preencho os campos obrigatórios:
      | Campo               | Valor          |
      | Nome                | faker          |
      | Sexo                | Masculino      |
      | CPF                 | faker          |
      | Data de nascimento  | 01/01/1990     |
      | RG                  | faker          |
      | Cargo               | Cargo 04       |
    E seleciono o checkbox "O trabalhador não usa EPI"
    E clico em "Salvar"
    E sou direcionado a página inicial
    Então valido que o funcionário foi adicionado na lista


    Cenário: Adicionar funcionario com status "Inativo"
    Dado que estou na página de adição de funcionário
    Quando preencho o campo "O trabalhador está ativo ou inativo" com "Inativo"
    E preencho os campos obrigatórios:
      | Campo               | Valor          |
      | Nome                | faker          |
      | Sexo                | Masculino      |
      | CPF                 | faker          |
      | Data de nascimento  | 01/01/1990     |
      | RG                  | faker          |
      | Cargo               | Cargo 04       |
    E seleciono os seguintes EPIs:
      | Atividade           | EPI                   | Número do CA |
      | Atividade 02        | Capacete de Segurança | faker        |
    E clico no botão "Adicionar EPI"
    Então vou conseguir preencher outro EPI
      | Atividade 03        | Óculos de Proteção    | faker        |
    E anexo um atestado de saúde ocupacional
    E clico no botão "Salvar"
    Então o funcionário faker é adicionado com sucesso
    E sou redirecionado para a tela inicial onde a lista de funcionários inclui faker mas com status inativo