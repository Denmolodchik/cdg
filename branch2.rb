require_relative 'controller2'
class Branch2
  PERMITTED_PATHS = ['deps']

  def Branch2.routing(path)
    if PERMITTED_PATHS.include?(path.split('/')[1]) && path.split('/').count == 3
      Controller2.show(path.split('/')[2])
    else
      {responce_code: 400, body: HTML.new.html_error('Вы ввели неправильный путь')}
    end
  end
end
