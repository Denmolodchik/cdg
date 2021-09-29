require_relative 'base_model'

class BranchModel1 < BaseModel
  DATA = [
    { id: 1, months: 10, percent: 10 },
    { id: 2, months: 20, percent: 20 }, 
    { id: 3, months: 30, percent: 30 }
  ]
  DATABASE = DATA.to_h { [_1[:id], _1] }
end
