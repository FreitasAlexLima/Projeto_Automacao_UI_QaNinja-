require "capybara"
require "capybara/cucumber"
require "faker"

Capybara.configure do |config|
    config.default_driver = :selenium_chrome
    config.app_host = "http://rocklov-web:3000" # A configuração do app_host possibilita uma manutenção melhor em caso de mudança do endereço web, visto que é necessário apenas ajustar nessa config invés de ajustar em todas as pastas.
    config.default_max_wait_time = 10
end
