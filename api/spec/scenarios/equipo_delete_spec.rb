#encoding: utf-8

describe 'DELETE /equipos/{equipo_id}' do

    before(:all) do
        payload = { email: "testesEquipo@uol.com.br", password: "pwd123"} 
        result = Sessions.new.login(payload) 
        @user_id = result.parsed_response["_id"] 
    end

    context 'Obter unico equipo' do
        
        before(:all) do
           
            # dado que eu tenha um novo equipamento
            
            payload = {
                thumbnail: Helpers::get_thumbnail("pedais.jpg"),
                name: "Pedais",
                category: "Aúdio e Tecnologia".force_encoding("ASCII-8BIT"),
                price: 199,
                }
             MongoDB.new.remove_equipo(payload[:name], @user_id) 
          
            # E que tenha o ID desse equipamento
            
            equipo = Equipos.new.create(payload, @user_id) 
            @equipo_id = equipo.parsed_response["_id"]
           
            # Quando faço uma requisição Delete por id
            @result = Equipos.new.remove_by_id(@equipo_id, @user_id)

        end

        # Então retorna status code 200

        it "deve retornar 204" do
            expect(@result.code).to eql 204
        end
    end

    context "Equipo nao existe" do
        
        before(:all) do
            @result = Equipos.new.remove_by_id(MongoDB.new.get_mongo_id, @user_id)
        end

        it "Deve retornar status code 204" do
            expect(@result.code).to eql 204
        end
    end
end