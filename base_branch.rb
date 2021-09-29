class BaseBranch

  def self.routing(path)
    id = path.match(self::PATTERN)
    if id
      if id['id'] == 'createform'
        create_form
      elsif id['id'] == 'create'
        create(path)
      else
        new_controller.show(id['id'])
      end
    else
      {response_code: 400, body: HTML.html_error('Вы ввели неправильный путь')}
    end
  end

  def new_controller
    raise NotImplementedError
  end

  def self.create_form
    { response_code: 200, body: HTML.html_form }
  end

  def self.create(path)
    {response_code: 400, body: HTML.html_error(path)}
  end
end
