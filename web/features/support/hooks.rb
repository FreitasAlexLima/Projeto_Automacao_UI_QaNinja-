Before do
  @login_page = Login_page.new
  @alert = Alert.new
  @signup = Signup_Page.new
  @dashpag = DashPage.new
  @equipo_page = Equipos_page.new

  page.current_window.resize_to(1440, 900)
end

After do
  temp_shot = page.save_screenshot("logs/temp_screenshot.png")

  Allure.add_attachment(
    name: "Screenshot",
    type: Allure::ContentType::PNG,
    source: File.open(temp_shot),
  )
end

# nesse gancho instanciamos a classe Login_page de forma global para todo o cenario,
# assim é necessario apenas  que a classe seja referenciada com @ sempre que o objeto seja usado.
