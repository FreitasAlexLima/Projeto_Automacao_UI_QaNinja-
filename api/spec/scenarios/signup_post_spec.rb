
describe "POST /signup" do
    
    context 'novo usuario' do
        before(:all) do
            payload = {name: "Alex", email: "afreitas468@gmail.com", password: "pwd123"}
            MongoDB.new.remove_user(payload[:email])

            @result = Signup.new.create(payload)
        end

        it "valida status code" do
            expect(@result.code).to eql 200
        end

        it "valida id do usuário" do
            expect(@result.parsed_response["_id"].length).to eql 24
        end

    end

    context 'usuario duplicado' do
        before(:all) do
            # Dado que tenho um novo usuario no sistema
            payload = {name: "Alan", email: "Alan@gmail.com", password: "pwd123"}
            MongoDB.new.remove_user(payload[:email])

            # E que este usuario já possua cadastro 
            Signup.new.create(payload)

            # Quando é feita uma nova requisição para cadastro desse usuario
            @result =  Signup.new.create(payload)

        end

        # Então é exibida a critica de email já existente.
        it 'usuario já existente' do
            expect(@result.parsed_response['error']).to eql 'Email already exists :('
        end
    end

    exemples = Helpers::get_fixures("signup")

    exemples.each do |e| 
        context "#{e[:title]}" do

            before(:all) do 
                @result =  Signup.new.create(e[:payload])
            end 
     
            it "valida status code #{e[:code]}" do
                expect(@result.code).to eql e[:code]
            end
    
            it "valida id do usuário" do
                expect(@result.parsed_response["error"]).to eql e[:error]
            end
        end    
    end

end