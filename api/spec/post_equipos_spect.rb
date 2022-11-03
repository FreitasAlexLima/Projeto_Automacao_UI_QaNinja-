describe 'POST/ equiposPage' do
    
    before(:all) do
        payload = { email: "testesEquipo@uol.com.br", password: "pwd123"}
        result = Sessions.new.login(payload)
        @user_id = result.parsed_response["_id"]
    end

    context 'cadastar novo equipo' do
        before(:all) do
            thumbnail = File.open(File.join(Dir.pwd + "/spec/fixtures/images", "kramer.jpg"))
            
            payload = {
                thumbnail: thumbnail,
                name: "kramer",
                category: "Cordas",
                price: 299,
            }
            @result = Equipos.new.create(payload, @user_id)
        end
       
        
        it "status code 200" do
            expect(@result.code).to eql 200
        end

    end




end