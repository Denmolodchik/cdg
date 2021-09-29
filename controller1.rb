require_relative 'branch_model1'
require_relative 'base_controller'

class Controller1 < BaseController
  def show(id)
    deposit = BranchModel1.find_by(id)
    render(deposit)
  end
end
