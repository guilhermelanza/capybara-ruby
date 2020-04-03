
describe 'Forms', :loginn do

    before(:each) do
        visit '/login'
    end
    
    it 'login com sucesso' do
        fill_in 'userId', with: 'stark'
        fill_in 'password', with: 'jarvis!'
        click_button 'Login'

        expect(find('#flash').visible?).to be true
        expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'
    end

end