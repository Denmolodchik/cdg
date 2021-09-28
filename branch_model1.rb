class BranchModel1 
  DATABASE = Hash[ 1 => { months: 10, percent: 10 } , 2 => { months: 20, percent: 20 } , 3 => { months: 30, percent: 30 } ]

  def self.find_by(id)
    DATABASE[id.to_i]
  end
end
