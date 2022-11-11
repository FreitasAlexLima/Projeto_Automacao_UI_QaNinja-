
describe " POST /equipos/{equipo_id}/bookings" do

    before(:all) do
        result = Sessions.new.login(email:"locador@gmail.com", password:"pwd123")
        @locator_id = result.parsed_response["_id"]
    end
    
    context 'Solicitar aluguel de equipamento' do
        
         # Dado que o usuario 'eduardo@bol.com.br' possua uma 'fender-strato' para locação
        before(:all) do
            result = Sessions.new.login(email:"eduardo@bol.com.br", password:"pwd123")
            ed_id = result.parsed_response["_id"]

            fender_payload = {
                thumbnail: Helpers::get_thumbnail("fender-sb.jpg"),
                name: "Fender strong",
                category: "Cordas",
                price: 499,
            }
            MongoDB.new.remove_equipo(fender_payload[:name], ed_id)
            result = Equipos.new.create(fender_payload, ed_id)
            id_fender = result.parsed_response["_id"]

         # quando solicito a locação de uma fender starto de outro usuario
            @result = Equipos.new.booking(id_fender, @locator_id)
        end

         # então retorna status code 200

        it "retorna status 200" do
            expect(@result.code).to eql 200
        end

    end

end