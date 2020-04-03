describe 'Upload', :upload do
    
    before(:each) do
        @arquivo = Dir.pwd + '/spec/fixtures/teste.txt'
        @imagem = Dir.pwd + '/spec/fixtures/google-logo.png'
        visit '/upload'
    end

    it 'Upload de arquivo txt' do
        attach_file('file-upload', @arquivo)
        click_button 'Upload'

        div_arquivo = find('#uploaded-file')
        expect(div_arquivo.text).to eql 'teste.txt'
    end

    it 'Upload de imagem', :upload_imagem do
        attach_file('file-upload', @imagem)
        click_button 'Upload'
        img = find('#new-image')
        expect(img[:src]).to include '/uploads/google-logo.png'
    end

    after(:each) do
        sleep 3
    end

end