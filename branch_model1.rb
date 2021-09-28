class BranchModel1 
  def BranchModel1.database
    Hash['1' => {months: 10, percent: 10},'2' => {months: 20, percent: 20},'3' => {months: 30, percent: 30}]
  end

  def BranchModel1.find_by(id)
    db = self.database
    if db.keys.include?(id)
      db[id]
    else
      {responce_code: 404, body: HTML.new.html_error('Депозита с таким именем не существует')}
    end
  end
end
