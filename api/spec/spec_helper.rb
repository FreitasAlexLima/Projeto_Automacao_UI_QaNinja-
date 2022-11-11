require_relative "routes/sessions"
require_relative "helpers"
require_relative "routes/signup"
require_relative "libs/mongo"
require_relative "routes/equipos"

require 'digest/md5' # essa lib faz a conversão do string para md5 (criptografia)

def to_md5(pass)
  return Digest::MD5.hexdigest(pass)  
end

RSpec.configure do |config|

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.before(:suite) do # criamos gancho (before) que será incluido uma unica vez nos sempre que o rspec for rodado
    users =[  # criamos uma array contendo todos a carga de usuarios que será utilizado para os testes
      {name: "Alex Lima", email: "alexfreitas468@gmail.com" , password: to_md5("pwd123")},
      {name: "Teste", email: "testesEquipo@uol.com.br" , password: to_md5("pwd123")},
      {name: "Lurdinha", email: "Lurdinha@gmail.com" , password: to_md5("pwd123")},
      {name: "Locador", email: "locador@gmail.com" , password: to_md5("pwd123")},
      {name: "Eduardo", email: "eduardo@bol.com.br" , password: to_md5("pwd123")},
    ]

    MongoDB.new.drop_danger # intanciamos o metodo de exclusão dos usuarios ( caso tenha alguma no banco).
    MongoDB.new.insert_users(users) # e realizamos a intancia do metodo de inclusão dos usuarios 'sementes' para que os testes do rspec sejam realizados.
  end
end
