
describe 'Ids Dinamicos', :idsDinamicos do

    before(:each) do
        visit '/access'
    end
    
    it 'Cadastro com sucesso' do
        find('input[id$=UsernameInput]').set 'Guilherme'
        find('input[id^=PasswordInput]').set '123456'
        find('a[id*=GetStartedButton]').click
        expect(page).to have_content 'Dados enviados. Aguarde aprovação do seu cadastro!'
    end

end