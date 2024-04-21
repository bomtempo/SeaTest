import faker from 'faker';

Cypress.Commands.add('visitUrl', () => {
    cy.visit('http://analista-teste.seatecnologia.com.br/');
    cy.title().should('eq', 'Sea Teste')
    cy.get('.c-kUQtTK').click();
});

Cypress.Commands.add('preencherFormulario', () => {
    cy.get('.ant-switch-inner').click();
    cy.get('[name="name"]').type(faker.name.findName());
    cy.get('[name="cpf"]').type(faker.random.number({ min: 10000000000, max: 99999999999 }).toString());
    cy.get('[name="rg"]').type(faker.random.number({ min: 10000000000, max: 99999999999 }).toString() + 's');
    cy.get('[title="Cargo 01"]').click();
    cy.get('[title="Cargo 04"]').click();
    cy.get('[title="Ativid 01"]').click();
    cy.contains('.ant-select-item-option-content', 'Ativid 02').click();
    cy.get('.c-kvYsjD > :nth-child(1) > .ant-select > .ant-select-selector > .ant-select-selection-item').click();
    cy.get('[title="Calçado de Segurança"] > .ant-select-item-option-content').click();
    cy.get('[name="caNumber"]').type(faker.random.number({ min: 100000000, max: 999999999 }).toString());
    cy.get('.addEPI').click();
});

Cypress.Commands.add('validarFuncionaldadeBotaoAdicionarEPI', () => {
    cy.get('.addEPI').click(); // Clica no botão de adicionar EPI
    cy.get('.epi-item').should('exist'); // Verifica se o EPI foi adicionado corretamente
})

Cypress.Commands.add('validarIntegridadeCampos', () => {
    cy.get('.ant-switch-inner').should('exist'); // Switch para mostrar campos obrigatórios
    cy.get('[name="name"]').should('exist'); // Campo de nome
    cy.get('[name="cpf"]').should('exist'); // Campo de CPF
    cy.get('[name="rg"]').should('exist');
    cy.get('[title="Cargo 01"]').should('exist');
    cy.get('[title="Ativid 01"]').should('exist');
    cy.get('.c-kvYsjD > :nth-child(1) > .ant-select > .ant-select-selector > .ant-select-selection-item').should('exist'); // Dropdown de EPI
    cy.get('[name="caNumber"]').should('exist');
});


Cypress.Commands.add('preencherDataNascimento', (data) => {
    const dataFormatada = data.toISOString().substring(0, 10);

    cy.get('[name="birthDay"]').then($input => {
        $input[0].value = dataFormatada;
    });
});

Cypress.Commands.add('marcarCheckbox', () => {
    cy.get('input.ant-checkbox-input').check();
});

let novoFuncionario = {}; // Variável global para armazenar as informações do novo funcionário

Cypress.Commands.add('salvarFormulario', () => {
    cy.get('.save').click();

    // Aguarda a resposta da API após salvar o formulário
    cy.wait('@saveEmployee').then((xhr) => {
        expect(xhr.response.statusCode).to.eq(201); // Verifica se a resposta é um código 201 (Created)
        novoFuncionario.nome = xhr.response.body.name;
        novoFuncionario.cpf = xhr.response.body.cpf;
    });
});

// Adiciona o alias da rota para a API de salvar funcionário
Cypress.Commands.add('salvarFuncionarioAPI', () => {
    cy.intercept('POST', '/employees').as('saveEmployee');
});



Cypress.Commands.add('validarNovoFuncionarioAdicionado', () => {
    cy.request('GET', 'http://analista-teste.seatecnologia.com.br/employees').then(response => {
        const novoFuncionarioAdicionado = response.body.find(funcionario =>
            funcionario.nome === novoFuncionario.nome && funcionario.cpf === novoFuncionario.cpf
        );
        expect(novoFuncionarioAdicionado).to.exist;
    });
});

