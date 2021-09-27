class BranchModel1 
  attr_accessor :error, :deposit

  def initialize
    @database = Hash['1' => {months: 10, percent: 10},'2' => {months: 20, percent: 20},'3' => {months: 30, percent: 30}]
  end

  def find_by(id)
    if @database.keys.include?(id)
      @deposit = @database[id]
    else
      @error = {responce_code: 404, body: HTML.new.html_error('Депозита с таким именем не существует')}
    end
  end
end
