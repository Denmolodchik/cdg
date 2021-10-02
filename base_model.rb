class BaseModel
  def self.validate(body)
    if !(body['months'] && body['precent'])
      "Поля количество месяцов и процент не могут быть пустыми"
    elsif (body['months'].to_i <= 0) || (body['precent'].to_i <= 0)
      "Поля количество месяцов и процент не могут быть меньше или равняться нулю"
    else
      nil
    end
  end

  def self.find_by(id)
    database = CSV.parse(File.read(self::PATH_DATABASE), headers: true)
    index = database.by_col[0].find_index(id)
    if index
      deposit = database[index]
      { id: deposit['id'], months: deposit['months'], percent: deposit['percent']}
    else
      nil
    end
  end

  def self.add_deposit(body)
    id = new_id

    CSV.open(self::PATH_DATABASE, 'ab') do |csv|
      csv << [id,body['months'],body['precent']]
    end
    
    id
  end

  def self.new_id
    id = CSV.parse(File.read(self::PATH_DATABASE), headers: true)

    if id[-1] == nil
      id = 1
    else 
      id = id[-1]['id'].to_i + 1
    end
  end
end
