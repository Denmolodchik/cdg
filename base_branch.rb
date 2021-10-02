class BaseBranch

  def self.routing(path, body, referer)
    path = path.match(self::PATTERN)
    if path
      if path['second_part'] == 'createform'
        new_controller.create_form
      elsif (path['second_part'] == 'create')
        if referer
          new_controller.create(body, path['first_part'])
        else
          { response_code: 200, body: HTML.redirect_to("/#{ path['first_part'] }/createform")}
        end
      else
        new_controller.show(path['second_part'])
      end
    else
      {response_code: 400, body: HTML.html_error('Вы ввели неправильный путь')}
    end
  end

  def new_controller
    raise NotImplementedError
  end
end
