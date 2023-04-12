require "mongo"

Mongo::Logger.logger = Logger.new("./logs/mongo.log")

class MongoDB
  attr_accessor :client, :users, :equipos

  def initialize
    @client = Mongo::Client.new(CONFIG["mongo"])
    @users = client[:users]
    @equipos = client[:equipos]
  end

  # metodo para inciar as variaveos  e ultilizalos nos metodos seguintes, deixando o codigo mais limpo.

  def drop_danger
    @client.database.drop
  end 

  # metodo para remover o clientes antes do semear através do rake

  def insert_users(docs)
    @users.insert_many(docs)
  end

  # metodo para incluir o clientes pelo semear através do rake

  def remove_user(email)
    @users.delete_many({ email: email })
  end

  # metodo para  remover o email antes de realizar um novo cadastro do email( teste)

  def get_users(email)
    user = @users.find({ email: email }).first
    return user[:_id]
  end

  # metodo para buscar o id do usuario

  def remove_equipo(name, email)
    user_id = get_users(email)
    @equipos.delete_many({ name: name, user: user_id })
  end

  # metodo para remover o anuncio repitido antes de realizar um novo cadatsro ( teste)

end

