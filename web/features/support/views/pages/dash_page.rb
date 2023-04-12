class DashPage
  include Capybara::DSL

  def on_dash?
    page.has_css?(".dashboard")
  end

  def go_to_equipolist
    click_button "Criar anúncio"
    
  end

  def equipo_list
    find(".equipo-list")
  end

  def delete_request(name)
    @equipos = find('.dashboard li', text: name)
    @equipos.find('.delete-icon').click
  end

  def confirm_delete
    click_button 'Sim'
  end

  def confirm_no_delete
    click_button 'Não'
  end

  def equipo_has_no_css?(name)
    return page.has_no_css?('.dashboard li', text:name)
  end

  def equipo_has_css?(name)
    return page.has_css?('.dashboard li', text:name)
  end

  def equipo_lacate_msg(name)
    return page.has_css?('.notification p', text:name)
  end

  def order
    return find('.notifications p')
  end

  def notification(name)
    return page.has_css?('.notifications button', text:name)
  end

end
