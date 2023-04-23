Quando('acesso a url') do
    @home = PaginaInicial.new
    @home.load
end
  
Então('confirmo a maior idade') do
    click_on('SIM')
end
  
Então('acesso a tela de cadastro') do
    @mapeando =MapeandoElementoPage.new
    @mapeando.load
end

Então('cadastrar usuario') do
    @mapeando.preencher
    find('#js-send-register').click
end
  
Então('verificar tela de confirmação') do
    confirmacao = @mapeando.find('.alert.alert-info.alert-dismissable.getAccAlert')
    expect(confirmacao).to have_content('Obrigado pelo seu Cadastramento!')
end
