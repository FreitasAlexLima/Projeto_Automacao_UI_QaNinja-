require "allure-cucumber"
require "capybara"
require "capybara/cucumber"
require "faker"

CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/Config/#{ENV["CONFIG"]}"))

case ENV["BROWSER"]
when "firefox"
  @driver = :selenium
when "fire_headless"
  @driver = :selenium_headless
when "chrome"
  @driver = :selenium_chrome
when "chrome_headless"
  @driver = :selenium_chrome_headless
else
  raise "Navegador Inválido"
end

Capybara.configure do |config|
  config.default_driver = @driver # modo headless executa o teste por 'baixo dos panos' sem mostrar a tela, no entanto com todas as caraceteristas do ui.
  config.app_host = CONFIG["url"] # A configuração do app_host possibilita uma manutenção melhor em caso de mudança do endereço web, visto que é necessário apenas ajustar nessa config invés de ajustar em todas as pastas.
  config.default_max_wait_time = 10
end

AllureCucumber.configure do |config|
  config.results_directory = "/logs"
  config.clean_results_directory = "true"
end
