class BranchModel2 
  attr_accessor :error, :deposit

  def initialize
    @database = Hash['1' => {months: 40, percent: 40},'2' => {months: 50, percent: 50}]
  end

  def find_by(id)
    if @database.keys.include?(id)
      @deposit = @database[id]
    else
      @error = {responce_code: 404, body: HTML.new.html_error('Депозита с таким именем не существует')}
    end
  end
end
