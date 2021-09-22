require_relative 'model_branch2'
class Controller2

  attr_accessor :deposit, :errors

  def show(id)
    _deposit = ModelBranch2.new
    _deposit.search(id)
    unless _deposit.errors
      @deposit = {responce_code: "200 OK", body: {id: id, months: _deposit.deposit[:months], percent: _deposit.deposit[:percent]}}
    else
      @errors = {responce_code: "404 Not Found", body: "Депозита с таким именем не существует"}
    end
  end
end
