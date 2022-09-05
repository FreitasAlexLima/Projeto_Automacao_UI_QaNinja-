require "routes/sessions"

describe "POST /sessions" do
   
    context "login com sucesso" do

        # criamos o gancho para que o o login ( pré condções dos testes) seja executando toda vez nates do teste rodar
        # o (:all) é o metodo que possibilita que o before a rode apenas uma vez para e que ele sirva para todos os testes dentro do contexto.
        # por questão de boas práticas do HTTParty é recomendo que não haja mais de um 'expect' (validação) para cada 'it' isso pois caso um dos 
        # it falhe o testes é abortado e a validação seguinte não é executado.
        
        before(:all) do 
           payload = { email: "alexfreitas468@gmail.com" , password: "alex123"}
           @result = Sessions.new.login(payload)
           # Como a responsabilidade de realizar o login vai tranferida para o 'page' sessions, no script do testes é necessario.. 
           #.. apenas instaciar a referida classe criada e acessar o metodo de login da mesma.
        end 
 
        it "valida status code" do
            expect(@result.code).to eql 200
        end

        it "valida id do usuário" do
            expect(@result.parsed_response["_id"].length).to eql 24
        end

        # criando um it para cada validação os testes são executado independente se o anterior passou ou não.
    end
    exemples = [
        {
            title:"Email invalido",
            payload:{ email: "alexfreitas46@gmail.com" , password: "alex123"},
            code:401,
            error:"Unauthorized"
        },
        {
            title:"Senha em branco",
            payload:{ email: "alexfreitas468@gmail.com" , password: ""},
            code:412,
            error:"required password"
        },
        {
            title:"Sem campo senha",
            payload:{ email: "alexfreitas468@gmail.com"},
            code:412,
            error:"required password"
        },
        {
            title:"Email em branco",
            payload:{ email: "", password: "alex123"},
            code:412,
            error:"required email"
        },
        {
            title:"Sem campo email",
            payload:{password: "alex123"},
            code:412,
            error:"required email"
        },
        {
            title:"Senha invalida",
            payload:{ email: "alexfreitas46@gmail.com" , password: "alex132"},
            code:401,
            error:"Unauthorized"
        }

    ]
    exemples.each do |e| 
        context "#{e[:title]}" do

            before(:all) do 
                @result = Sessions.new.login(e[:payload])
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