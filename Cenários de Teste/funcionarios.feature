Funcionalidade: Gerenciamento de Funcionários

  Contexto:
    Como um administrador do sistema
    Eu quero gerenciar os funcionários cadastrados
    Para manter um controle eficiente da equipe

  Cenário: Visualizar e Gerenciar Funcionários
    Dado que estou na página "Funcionários"
    E existem funcionários cadastrados no sistema
    Quando visualizo a lista de funcionários
    Então vejo o botão "Adicionar Funcionários"
    E vejo os botões "Ver apenas ativos" e "Limpar Filtros"
    E vejo a quantidade de funcionários ativos no formato "2/4"
    E vejo a lista de funcionários contendo:
      | Nome Completo | CPF            | Ativo | Cargo         |
    E vejo o botão "..." para cada funcionário
    E vejo o botão "A etapa está concluída" "Não"
    Então vejo o botão "Próximo passo" desabilitado

  Cenário: Alterar Informações de Funcionário
    Dado que estou na página "Funcionários"
    Quando clico no botão "..." ao lado do funcionário "fake"
    E seleciono a opção "Alterar"
    Então sou redirecionado para a página de adicionar funcionário preenchida com os dados de "fake"

  Cenário: Excluir Funcionário
    Dado que estou na página "Funcionários"
    Quando clico no botão "..." ao lado do funcionário "fake"
    E seleciono a opção "Excluir"
    E confirmo a exclusão na mensagem de confirmação
    Então vejo a mensagem "Usuário excluído com sucesso"
    E a lista de funcionários é atualizada validando a remoção do "fake"

  Cenário: Marcar Etapa como Concluída
    Dado que estou na página "Funcionários"
    Quando seleciono a opção "A etapa está concluída" como "Sim"
    Então o botão "Próximo passo" fica ativado
    E sua cor muda para indicar que está ativo
    E o ícone de progresso da etapa é marcado como concluído

  Cenário: Navegar entre Opções no Menu Lateral
    Dado que estou na página "Funcionários"
    Quando navego pelo menu lateral esquerdo
    Então consigo acessar diferentes opções de gerenciamento de funcionários
  
  Cenário: Filtrar pelos funcionarios "ativos"
    Dado que estou na página "Funcionários"
    Quando clico "Ver apenas ativos"
    Então na lista aparecem somente os funcionarios "ativos"
  
  Cenário: Filtrar pelos funcionarios "ativos"
    Dado que estou na página "Funcionários"
    Quando clico "Limpar filtros"
    Então na lista aparecem todos os funcionários cadastrados

