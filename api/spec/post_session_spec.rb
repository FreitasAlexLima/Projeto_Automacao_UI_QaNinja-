require "httparty"

describe "POST /sessions" do
    it "login com sucesso" do

        payload = {email: "alexfreitas468@gmail.com", password: "alex123"}

        result = HTTParty.post(
            "http://rocklov-api:3333/sessions", 
            body: payload.to_json,
            headers: { 
                "Content-Type": " application/json",
            },
        )

        expect(result.code).to eql 200
    end
end