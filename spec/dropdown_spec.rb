
describe 'Combobox', :dropdown do

    after(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/dropdown'
    end
    
    it 'Item específico simples' do
        select('Loki', from: 'dropdown')
    end

    it 'Item específico simples com o find' do
        drop = find('.avenger-list')
        drop.find('option', text: 'Scott Lang').select_option
    end

    it 'Qualquer item' do
        drop = find('.avenger-list')
        drop.all('option').sample.select_option
    end

    after(:each) do
        sleep 2
    end

end