describe('Testes automatizados SeaTecnologia', () => {
  it('Validando Titulo da página', () => {
    cy.visitUrl();
  })

  it('Salvando Formulário', () => {
    const dataNascimento = new Date(1990, 3, 25); // Data de nascimento do novo funcionário

    cy.visitUrl();
    cy.preencherFormulario();
    cy.preencherDataNascimento(dataNascimento);
    cy.marcarCheckbox(); // Marca o checkbox

    cy.salvarFuncionarioAPI(); // Inicia a interceptação da rota para salvar o funcionário
    cy.salvarFormulario(); // Salva o formulário do novo funcionário
});

it('Validando Novo Funcionário Adicionado', () => {
    cy.validarNovoFuncionarioAdicionado(); // Valida se o novo funcionário foi adicionado corretamente
});

})
