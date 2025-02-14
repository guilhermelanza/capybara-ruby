
describe 'Forms Campo Randômico', :login2 do

    before(:each) do
        visit '/login2'
    end
    
    it 'login com data de nascimento' do
        find('#userId').set 'stark'
        find('#passId').set 'jarvis!'

        login_form = find('#login')

        case login_form.text
        when /Dia/
            find('#day').set '29'
        when /Mês/
            find('#month').set '05'
        when /Year/
            find('#year').set '1970'
        end
        
        click_button 'Login'        
        expect(find('#flash').visible?).to be true
        expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'
    end

end