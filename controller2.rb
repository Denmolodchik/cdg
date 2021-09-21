class Controller1
  attr_accessor :deposit, :errors
  def show(id)
    if path.split('/')[2] == '1'
      @deposit = {responce_code: "200 OK", deposit: {id: 1, months: 10, percent: 10}}
    elsif path.split('/')[2] == '2'
      @deposit = {responce_code: "200 OK", deposit: {id: 2, months: 20, percent: 20}}
    elsif path.split('/')[2] == '3'
      @deposit = {responce_code: "200 OK", deposit: {id: 3, months: 30, percent: 30}}
    else
      @errors = {responce_code: "404 Not Found", body: "Депозита с таким именем не существует"}
    end
  end


end
