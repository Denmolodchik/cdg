require_relative 'branch_model1'
require_relative 'base_controller'

class Controller1 < BaseController
  def new_model
    BranchModel1
  end
end
