require "mongo"

Mongo::Logger.logger = Logger.new("./logs/mongo.log")

class MongoDB
    attr_accessor :users, :equipos

  def initialize
    client = Mongo::Client.new("mongodb://rocklov-db:27017/rocklov")
    @users = client[:users]
    @equipos = client[:equipos]
  end

  def remove_user(email)
    @users.delete_many({ email: email })
  end

  # metodo para  remover o email antes de realizar um novo cadastro do email( teste)

  def get_users(email)
    user = users.find({ email: email }).first
    return user[:_id]
  end

  # metodo para buscar o id do usuario

  def remove_equipo(name, email)
    user_id = get_users(email)
    @equipos.delete_many({ name: name, user: user_id })
  end

  # metodo para remover o anuncio repitido antes de realizar um novo cadatsro ( teste)

end
