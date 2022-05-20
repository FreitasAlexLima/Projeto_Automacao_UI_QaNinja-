Before do
  @login_page = Login_page.new
  @alert = Alert.new
  @signup = Signup_Page.new
  @dashpag = DashPage.new
  @equipo_page = Equipos_page.new

  page.current_window.resize_to(1380, 900)
end

# nesse gancho instanciamos a classe Login_page de forma global para todo o cenario,
# assim é necessario apenas  que a classe seja referenciada com @ sempre que o objeto seja usado.
