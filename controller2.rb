require_relative 'branch_model2'
require_relative 'base_controller'

class Controller2 < BaseController
  def show(id)
    deposit = BranchModel2.find_by(id)
    render(deposit)
  end
end
