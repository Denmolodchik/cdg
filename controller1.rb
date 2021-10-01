require_relative 'branch_model1'
require_relative 'base_controller'

class Controller1 < BaseController
  def show(id)
    deposit = BranchModel1.find_by(id)
    render(deposit)
  end

  def create(body)
    deposit = BranchModel1.validate(body)
    if deposit 
      deposit
    else
      show(BranchModel1.add_deposit(body).to_s)
    end
  end
end
