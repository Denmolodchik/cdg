require_relative 'branch_model1'
class Controller1
  def Controller1.show(id)
    _deposit = BranchModel1.find_by(id)
    if _deposit[:responce_code] == 404
      _deposit
    else
      {responce_code: 200, body: HTML.new.html_deposit({id: id, months: _deposit[:months], percent: _deposit[:percent]})}
    end
  end
end
