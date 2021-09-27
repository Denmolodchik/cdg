require_relative 'controller2'
class Branch2
  attr_accessor :deposit, :error

  PERMITTED_PATHS = ['deps']

  def initialize(path)
    if PERMITTED_PATHS.include?(path.split('/')[1]) && path.split('/').count == 3
      @deposit = Controller2.new.show(path.split('/')[2])
    else
      @error = {responce_code: 400, body: HTML.new.html_error('Вы ввели неправильный путь')}
    end
  end
end
