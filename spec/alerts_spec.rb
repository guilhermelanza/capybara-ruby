describe 'Alertas', :alerts do
    
    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/javascript_alerts'
    end

    it 'Alerta mensagem' do
        click_button 'Alerta'

        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'Isto é uma mensagem de alerta'
        sleep 1
    end

    it 'Alerta confirma: Ok' do
        click_button 'Confirma'

        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'E ai confirma?'
        
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content 'Mensagem confirmada'
    end    

    it 'Alerta confirma: Cancel' do
        click_button 'Confirma'

        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'E ai confirma?'
        
        page.driver.browser.switch_to.alert.dismiss
        expect(page).to have_content 'Mensagem não confirmada'
    end

    it 'Aceita prompt', :accept_prompt do
        accept_prompt(with: 'Lanza') do
            click_button 'Prompt'
            sleep 2
        end

        expect(page).to have_content 'Olá, Lanza'
        sleep 2
    end

    it 'Cancela prompt', :dismiss_prompt do
        dismiss_prompt(with: 'Lanza') do
            click_button 'Prompt'
            sleep 2
        end

        expect(page).to have_content 'Olá, null'
        sleep 2
    end

end