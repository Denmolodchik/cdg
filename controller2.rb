require_relative 'branch_model2'
class Controller2
  attr_accessor :deposit, :error

  def show(id)
    _deposit = BranchModel2.new.find_by(id)
    if _deposit[:responce_code] == 404
      @error = _deposit
    else
      @deposit = {responce_code: 200, body: HTML.new.html_deposit({id: id, months: _deposit[:months], percent: _deposit[:percent]})}
    end
  end
end
