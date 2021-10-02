require_relative 'branch_model2'
require_relative 'base_controller'

class Controller2 < BaseController
  def new_model
    BranchModel2
  end
end
