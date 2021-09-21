class ModelBranch1
  attr_accessor :database

  def database(id)
    @database = {'1': {months: 10, percent: 10},'2': {months: 20, percent: 20},'3': {months: 30, percent: 30}}
  end
end
