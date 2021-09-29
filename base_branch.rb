class BaseBranch

  def self.routing(path)
    id = path.match(self::PATTERN)
    if id
      new_controller.show(id['id'])
    else
      {response_code: 400, body: HTML.html_error('Вы ввели неправильный путь')}
    end
  end

  def new_controller
    raise NotImplementedError
  end
end
