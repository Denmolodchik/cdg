require_relative 'controller2'
class Branch2
  PERMITTED_PATHS = ['deps']

  def self.routing(path)
    path = path.split('/')
    if PERMITTED_PATHS.include?(path[1]) && path.count == 3
      Controller2.show(path[2])
    else
      {responce_code: 400, body: HTML.html_error('Вы ввели неправильный путь')}
    end
  end
end
