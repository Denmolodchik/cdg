require_relative 'branch_model1'
class Controller1
  def self.show(id)
    deposit = BranchModel1.find_by(id)
    if deposit
      { responce_code: 200, body: HTML.html_deposit( { id: id, months: deposit[:months], percent: deposit[:percent] } )}
    else
      { responce_code: 404, body: HTML.html_error('Депозита с таким именем не существует') }
    end
  end
end
