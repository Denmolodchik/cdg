class BranchModel2 
  DATABASE = Hash[ 1 => { months: 40, percent: 40 } , 2 => { months: 50, percent: 50 } ]

  def self.find_by(id)
    id = id.to_i
    DATABASE[id] if DATABASE.keys.include?(id)
  end
end
