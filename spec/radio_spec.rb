describe 'Radio', :radio do
    
    before(:each) do
        visit 'https://training-wheels-protocol.herokuapp.com/radios'
    end

    it 'Marcando por id' do
        choose('cap')
    end

    it 'Marcando por find e css selector' do
        find('input[value=guardians]').click
    end

    after(:each) do
        sleep 3
    end

end