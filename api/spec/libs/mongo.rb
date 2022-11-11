require "mongo"

Mongo::Logger.logger = Logger.new("./logs/mongo.log")

class MongoDB
  attr_accessor :client, :users, :equipos

  def initialize
    @client = Mongo::Client.new("mongodb://rocklov-db:27017/rocklov")
    @users = client[:users]
    @equipos = client[:equipos]
  end

  def drop_danger
    client.database.drop
  end
  
 # Criamos os metodos do mongo para inserir os usuarios e outro spr certifizar que não tenham conflitos na hr da inclusão

  def insert_users(docs)
    @users.insert_many(docs)
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

  def remove_equipo(name, user_id)
    object_id = BSON::ObjectId.from_string(user_id) # converte a infromação do tipo string para objectID a qual o mongo trabalha bem.
    @equipos.delete_many({ name: name, user: object_id })
  end

  # metodo para remover o anuncio repitido antes de realizar um novo cadatsro ( teste)

  def get_mongo_id
    return BSON::ObjectId.new
  end

  # metodo para gerar um objeto aleatorio no formato ID do mongoDB
end
