require_relative "base_api"

class Sessions < BaseApi
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

# DRY - Don't reapeat yourself ( não se repita) padrão que utiliza o encapsulamento para evitar retrabalhos
# DRY vs Teste - Em alguns casos é melhor que haja repetições para que a clareza do teste não seja comprometida.
