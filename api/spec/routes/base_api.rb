require "httparty"

class BaseApi
    include   HTTParty
    base_uri "http://rocklov-api:3333" # propiedade do httparty que recebe a url
end