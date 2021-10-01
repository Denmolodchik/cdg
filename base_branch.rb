class BaseBranch

  def self.routing(path, body)
    second_part = path.match(self::PATTERN)
    if second_part
      if second_part['second_part'] == 'createform'
        new_controller.create_form
      elsif second_part['second_part'] == 'create'
        new_controller.create(body)
      else
        new_controller.show(second_part['second_part'])
      end
    else
      {response_code: 400, body: HTML.html_error('Вы ввели неправильный путь')}
    end
  end

  def new_controller
    raise NotImplementedError
  end
end
