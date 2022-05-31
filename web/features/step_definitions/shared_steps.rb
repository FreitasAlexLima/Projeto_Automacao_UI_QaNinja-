Então('sou redirecionado para o dashboard') do
   expect(@dashpag.on_dash?).to be true
end

Então('vejo a mensagem de alerta: {string}') do |expect_alert|
    expect(@alert.dark).to eql expect_alert
end