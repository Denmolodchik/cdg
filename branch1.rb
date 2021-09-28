require_relative 'controller1'
class Branch1
  PATTERN = /^\/(deposits)\/([0-9]+)$/m

  def self.routing(path)
    path = path.match(PATTERN)
    if path
      Controller1.show(path[2])
    else
      {responce_code: 400, body: HTML.html_error('Вы ввели неправильный путь')}
    end
  end
end
