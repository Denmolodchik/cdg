class BaseController
  
  private

  def render(deposit)
    if deposit
      { response_code: 200, body: HTML.html_deposit(deposit)}
    else
      { response_code: 404, body: HTML.html_error('Депозита с таким именем не существует') }
    end
  end
end
