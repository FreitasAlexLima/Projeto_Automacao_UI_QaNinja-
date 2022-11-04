describe "POST /equipos" do
    # Dado que o usuário esteja logado na plataforma rocklov
    before(:all) do
        payload = { email: "testesEquipo@uol.com.br", password: "pwd123"} # header da requisição (para gerar o token)
        result = Sessions.new.login(payload) # instancia a classe de login e armazendo em uma variavel
        @user_id = result.parsed_response["_id"] # armazena em uma variavel global o id que veio do response da requisição
    end

    context 'cadastar novo equipo' do
        # Quando realizar oa cadastro de uma novo equipamento com dados corretos
        before(:all) do
           # thumbnail = File.open(File.join(Dir.pwd + "/spec/fixtures/images", "kramer.jpg"), "rb") # argumento 'rb'  para informar que a leitura é apenas de forma não binaria
            payload = {
                thumbnail: Helpers::get_thumbnail("kramer.jpg"), # funcção para buscar imagem foi emcapsulada no aquivo de helpers,
                name: "kramer",
                category: "Cordas",
                price: 299,
            }
            MongoDB.new.remove_equipo(payload[:name], @user_id) # instacia a classe do mongoDB e utiliza o metodo remove com name e ID de argumentos para remover  cadastros anteriores e não haver conflitos.

            @result = Equipos.new.create(payload, @user_id) # armazena dentro da variavel @result a instacia da classe Equipos 
        end
        # Então é retornado o status code 200
        it "status code 200" do
            expect(@result.code).to eql 200 # através da variavel result podemos acessar o metódo cod, que é retornado junto a reponde da requisição
        end
    end

    context 'cadastro nao autorizado' do
        before(:all) do
            payload = {
                thumbnail: Helpers::get_thumbnail("baixo.jpg"),
                name: "Contra baixo",
                category: "Cordas",
                price: 69,
            }
            @result = Equipos.new.create(payload, nil) 
        end
      
        it "status code 401" do
            expect(@result.code).to eql 401
        end
    end
end