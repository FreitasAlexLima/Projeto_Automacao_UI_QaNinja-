

describe 'GEt /equipos/{equipo_id}' do

    before(:all) do
        payload = { email: "testesEquipo@uol.com.br", password: "pwd123"} # header da requisição (para gerar o token)
        result = Sessions.new.login(payload) # instancia a classe de login e armazendo em uma variavel
        @user_id = result.parsed_response["_id"] # armazena em uma variavel global o id que veio do response da requisição
    end

    context 'Obter unico equipo' do
        
        before(:all) do
           
            # dado que eu tenha um novo equipamento
            
            payload = {
                thumbnail: Helpers::get_thumbnail("sanfona.jpg"), # funcção para buscar imagem foi emcapsulada no aquivo de helpers,
                name: "Sanfona",
                category: "Outros",
                price: 499,
                }
             MongoDB.new.remove_equipo(payload[:name], @user_id) # instancia a classe do mongoDB e utiliza o metodo remove com name e ID de argumentos para remover  cadastros anteriores e não haver conflitos.
          
            # E que tenha o ID desse equipamento
            
            equipo = Equipos.new.create(payload, @user_id) # armazena dentro da variavel @equipo a instacia da classe Equipos 
            @equipo_id = equipo.parsed_response["_id"]
            puts  @equipo_id
           
            # Quando faço uma requisição GET por id
            @result = Equipos.new.find_by_id(@equipo_id, @user_id)
            puts    @result
        end

        # Então retorna status code 200

        it "deve retornar 200" do
            expect(@result.code).to eql 200
        end

        it "deve retorno o nome" do
            expect(@result.parsed_response).to include("name" => @payload[:name])
        end
    end

    context "Equipo nao existe" do
        
        before(:all) do
            @result = Equipos.new.find_by_id(MongoDB.new.get_mongo_id, @user_id)
        end

        it "Deve retornar status code 404" do
            expect(@result.code).to eql 404
        end
    end
end