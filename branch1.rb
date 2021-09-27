require_relative 'controller1'
class Branch1
  attr_accessor :deposit, :error 
  
  PERMITTED_PATHS = ['deposits']
   
  def initialize(path)
    if PERMITTED_PATHS.include?(path.split('/')[1]) && path.split('/').count == 3
      answer = Controller1.new.show(path.split('/')[2])
      if answer[:responce_code] == 404
        @error = answer
      else
        @deposit = answer
      end
    else
      @error = {responce_code: 400, body: HTML.new.html_error('Вы ввели неправильный путь')}
    end
  end
end
