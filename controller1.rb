require_relative 'model_branch1'
class Controller1

  attr_accessor :deposit, :errors
  
  def show(id)
    _deposit = ModelBranch1.new
    _deposit.search(id)
    unless _deposit.errors
      @deposit = {responce_code: "200 OK", body: {id: id, months: _deposit.deposit[:months], percent: _deposit.deposit[:percent]}}
    else
      @errors = {responce_code: "404 Not Found", body: "Депозита с таким именем не существует"}
    end
  end
end
