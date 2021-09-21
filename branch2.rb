class Branch2
  attr_accessor :path, :errors
  PERMITTED_PATHS = ['deps']
  def initialize(path)
      if PERMITTED_PATHS.include?(path.split('/')[1]) && path.split('/').count == 3
        @id = path.split('/')[2]
      else
        @errors = {responce_code: "400 Bad Request", body: "Вы ввели неправильный путь"}
      end
  end
end
