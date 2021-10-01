require_relative 'base_model'
require 'csv'

class BranchModel1 < BaseModel

  def self.find_by(id)
    database = CSV.parse(File.read('database1.csv'), headers: true)
    index = database.by_col[0].find_index(id)
    if index
      deposit = database[index]
      { id: deposit['id'], months: deposit['months'], percent: deposit['percent']}
    else
      nil
    end
  end

  def self.add_deposit(body)
    id = CSV.parse(File.read('database1.csv'), headers: true)

    if id[-1] == nil
      id = 1
    else 
      id = id[-1]['id'].to_i + 1
    end

    CSV.open('database1.csv', 'ab') do |csv|
      csv << [id,body['months'],body['precent']]
    end
    
    id
  end
end
