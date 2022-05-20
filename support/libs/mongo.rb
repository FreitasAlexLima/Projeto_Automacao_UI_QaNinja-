require "mongo"

Mongo::Logger.logger = Logger.new("./logs/mongo.log")

class MongoDB
  def remove_user(email)
    client = Mongo::Client.new("mongodb://rocklov-db:27017/rocklov")
    users = client[:users]
    users.delete_many({ email: email })
  end

  # metodo para  remover o email antes de realizar um novo cadastro do email( teste)

  def get_users(email)
    client = Mongo::Client.new("mongodb://rocklov-db:27017/rocklov")
    users = client[:users]
    user = users.find({ email: email }).first
    return user[:_id]
  end

  # metodo para buscar o id do usuario

  def remove_equipo(name, email)
    user_id = get_users(email)
    client = Mongo::Client.new("mongodb://rocklov-db:27017/rocklov")
    equipos = client[:equipos]
    equipos.delete_many({ name: name, user: user_id })
  end

  # metodo para remover o anuncio repitido antes de realizar um novo cadatsro ( teste)

end
