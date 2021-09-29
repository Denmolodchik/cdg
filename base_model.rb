class BaseModel
  def self.find_by(id)
    self::DATABASE[id.to_i]
  end
end
