class BranchModel2 
  def BranchModel2.database
    Hash['1' => {months: 40, percent: 40},'2' => {months: 50, percent: 50}]
  end

  def BranchModel2.find_by(id)
    db = self.database
    if db.keys.include?(id)
      db[id]
    else
      {responce_code: 404, body: HTML.new.html_error('Депозита с таким именем не существует')}
    end
  end
end
