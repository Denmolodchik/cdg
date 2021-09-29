require_relative 'base_model'

class BranchModel2 < BaseModel
  DATA = [
      { id: 1, months: 40, percent: 40 }, 
      { id: 2, months: 50, percent: 50 } 
  ]
  DATABASE = DATA.to_h { [_1[:id], _1] }

  def self.find_by(id)
    super
  end
end
