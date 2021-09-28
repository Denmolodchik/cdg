class BranchModel2 
  DATABASE = { 1 => { months: 40, percent: 40 } , 2 => { months: 50, percent: 50 } }

  def self.find_by(id)
    DATABASE[id.to_i]
  end
end
