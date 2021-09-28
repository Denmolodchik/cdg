class BranchModel1 
  DATABASE = Hash[ 1 => { months: 10, percent: 10 } , 2 => { months: 20, percent: 20 } , 3 => { months: 30, percent: 30 } ]

  def self.find_by(id)
    id = id.to_i
    DATABASE[id] if DATABASE.keys.include?(id)
  end
end
