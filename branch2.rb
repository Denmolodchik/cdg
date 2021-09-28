require_relative 'controller2'
class Branch2
  PATTERN = /^\/(deps)\/([0-9]+)$/m

  def self.routing(path)
    path = path.match(PATTERN)
    if path
      Controller2.show(path[2])
    else
      {responce_code: 400, body: HTML.html_error('Вы ввели неправильный путь')}
    end
  end
end
