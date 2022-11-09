require_relative "base_api"

class Equipos < BaseApi
    def create(payload, user_id)
        return self.class.post(
            "/equipos", 
            body: payload,
            headers: { 
                "user_id": user_id
            },
        )
    end

    def find_by_id(equipo_id, user_id) # metodo para buscar por id, utilizando os argumentos "equipo_id" e 'User_id'
        return self.class.get( # retorno do metodo é um GET
            "/equipos/#{equipo_id}", # rota da api com interpolação para completar o endereço correto do equipamento ( que possue o id no final)
            headers: {
                "user_id": user_id, # o headers  realizar aautorização para que a consulta seja realizado.
            },
        )
    end

    def remove_by_id(equipo_id, user_id) # metodo para buscar por id, utilizando os argumentos "equipo_id" e 'User_id'
        return self.class.delete( # retorno do metodo é um delete
            "/equipos/#{equipo_id}", # rota da api com interpolação para completar o endereço correto do equipamento ( que possue o id no final)
            headers: {
                "user_id": user_id, # o headers  realizar aautorização para que a consulta seja realizado.
            },
        )
    end
end 