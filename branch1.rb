require_relative 'controller1'
class Branch1
  PERMITTED_PATHS = ['deposits']

  def Branch1.routing(path)
    if PERMITTED_PATHS.include?(path.split('/')[1]) && path.split('/').count == 3
      Controller1.show(path.split('/')[2])
    else
      {responce_code: 400, body: HTML.new.html_error('Вы ввели неправильный путь')}
    end
  end
end
