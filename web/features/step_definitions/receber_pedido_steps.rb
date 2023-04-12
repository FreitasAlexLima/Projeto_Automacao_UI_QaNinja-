Dado('que possuo um perfil de anuciante {string} e {string}') do |email, password|
 @email_anunciante = email
 @password_anunciante = password
end

Dado('que possuo o seguinte anúncio cadastrado:') do |table|
    user_id = SessionsService.new.get_id_user(@email_anunciante, @password_anunciante)
    thumbnail = File.open(File.join(Dir.pwd + "/features/support/fixtures/images", table.rows_hash[:thumb]), "rb")
    @equipo = {
      thumbnail: thumbnail,
      name: table.rows_hash[:nome],
      category: table.rows_hash[:categoria],
      price: table.rows_hash[:preco]
    }
    MongoDB.new.remove_equipo(@equipo[:name], @email_anunciante)

   result = EquipoService.new.create(@equipo,user_id)
   @equipo_id =  result.parsed_response["_id"]
end

Dado('acesso o meu dashboard') do                                                                       
    @login_page.open
    @login_page.with(@email_anunciante, @password_anunciante)
    expect(@dashpag.on_dash?).to be true # checkpoint para acertificar que foi logado
end                                                                                                     

Quando('{string} e {string} solicita a locação desse equipamento') do |email, password|
    user_id = SessionsService.new.get_id_user(email, password)
    EquipoService.new.booking(@equipo_id, user_id)
end

Então('devo ver a seguinte mensagem') do |doc_string|
    expect_message = doc_string.gsub('DATA_LOCACAO', Time.now.strftime("%d-%m-%Y"))
    expect(@dashpag.order).to have_text expect_message
end

Então('devo ver os links {string} e {string} no pedido') do |accept_mensage, reject_mensage|
    expect(@dashpag.notification(accept_mensage)).to be true
    expect(@dashpag.notification(reject_mensage)).to be true
    # expect(page).to have_selector ".notification button", text: reject_mensage
end