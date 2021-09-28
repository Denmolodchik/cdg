require_relative 'branch_model2'
class Controller2
  def Controller2.show(id)
    _deposit = BranchModel2.find_by(id)
    if _deposit[:responce_code] == 404
      _deposit
    else
      {responce_code: 200, body: HTML.new.html_deposit({id: id, months: _deposit[:months], percent: _deposit[:percent]})}
    end
  end
end
