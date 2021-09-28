require_relative 'controller1'
class Branch1
  PERMITTED_PATHS = ['deposits']

  def self.routing(path)
    path = path.split('/')
    if PERMITTED_PATHS.include?(path[1]) && path.count == 3
      Controller1.show(path[2])
    else
      {responce_code: 400, body: HTML.html_error('Вы ввели неправильный путь')}
    end
  end
end
