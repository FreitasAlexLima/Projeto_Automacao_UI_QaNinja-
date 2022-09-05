require "httparty"


# DRY - Don't reapeat yourself ( não se repita) padrão que utiliza o encapsulamento para evitar retrabalhos
# DRY vs Teste - Em alguns casos é melhor que haja repetições para que a clareza do teste não seja comprometida.

class Sessions 

    include   HTTParty
    base_uri "http://rocklov-api:3333" # propiedade do httparty que recebe a url

    def login(payload)

        return self.class.post(
            "/sessions", 
            body: payload.to_json,
            headers: { 
                "Content-Type": " application/json",
            },
        )
        
    end

end 