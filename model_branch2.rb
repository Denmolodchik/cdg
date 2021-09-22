class ModelBranch2 
  attr_accessor :errors, :deposit
  attr_reader :database

  def initialize
    @database = {'1': {months: 40, percent: 40},'2': {months: 50, percent: 50}}
  end

  def search(id)
    id = id.to_sym
    if @database.keys.include?(id)
      @deposit = @database[id]
    else
      @errors = {responce_code: '404 Not Found', body: 'Депозита с таким именем не существует'}
    end
  end
end
