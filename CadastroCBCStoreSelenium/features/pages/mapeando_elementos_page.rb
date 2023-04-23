class MapeandoElementoPage<SitePrism::Page
     set_url 'store/pt/login'

     element :nome, '#firstName'
     element :cpf, '#cpf'
     element :data_nascimento, '#birthday'
     element :celular, '#cellphone' 
     element :estado, '#state'
     element :email, '#email'
     element :confirmar_email, '#checkEmail'
     element :senha, '#pwd'
     element :confirma_senha, '#checkPwd'

     def preencher
      find('#segmentCategory').click
      find('option', text: 'PESSOA FÍSICA').click
      find('#categories').click
      find('option[value="SEGMENT_1B"]').click
      nome.set 'Tiago Teste'
      cpf.set '221.341.747-49'
      data_nascimento.set '08/02/1990'
      celular.set '(24) 98888-8888'
      find('#state').click
      find('option[value="RJ"]').click
      email.set 'tiagoteste@test.com'
      confirmar_email.set 'tiagoteste@test.com'
      senha.set 'Teste123$'
      confirma_senha.set 'Teste123$' 
     end
end