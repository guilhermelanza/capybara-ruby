describe 'iframes' do
    
    describe 'bom', :niceIframes do
        before(:each) do
            visit '/nice_iframe'
        end

        it 'Adicionar ao carrinho' do
            within_frame('burguerId') do
                produto = find('.menu-item-info-box', text: 'REFRIGERANTE')
                produto.find('a').click
                expect(find('#cart')).to have_content 'R$ 4,50'
            end
        end
    end

    describe 'ruim', :badIframes do
        before(:each) do
            visit '/bad_iframe'
        end

        it 'Carrinho vazio' do

            script = '$(".box-iframe").attr("id", "tempId");'
            page.execute_script(script)

            within_frame('tempId') do
                expect(find('#cart')).to have_content 'Seu carrinho está vazio!'
                sleep 2
            end
        end
    end

end