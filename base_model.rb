class BaseModel
  #def self.find_by(id)
  #  self::DATABASE[id.to_i]
  #end

  def self.validate(body)
    if !(body['months'] && body['precent'])
      {response_code: 412, body: HTML.html_error("Поля количество месяцов и процент не могут быть пустыми")}
    elsif (body['months'].to_i <= 0) || (body['precent'].to_i <= 0)
      {response_code: 412, body: HTML.html_error("Поля количество месяцов и процент не могут быть меньше или равняться нулю")}
    else
      nil
    end
  end
end
