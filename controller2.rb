require_relative 'branch_model2'
class Controller2
  def self.show(id)
    deposit = BranchModel2.find_by(id)
    if deposit
      { responce_code: 200, body: HTML.html_deposit( { id: id, months: deposit[:months], percent: deposit[:percent] } ) }
    else
      { responce_code: 404, body: HTML.html_error('Депозита с таким именем не существует') }
    end
  end
end
