class BaseController
  def create_form
    { response_code: 200, body: HTML.html_form }
  end

  def create(body)
    raise NotImplementedError
  end

  def show(id)
    deposit = new_model.find_by(id)
    render(deposit)
  end

  def create(body, first_part)
    error = new_model.validate(body)
    if error
      {response_code: 412, body: HTML.html_error(error)}
    else
      { response_code: 200, body: HTML.redirect_to("/#{first_part}/#{new_model.add_deposit(body).to_s}")}
    end
  end

  def new_model
    raise NotImplementedError
  end
  
  private

  def render(deposit)
    if deposit
      { response_code: 200, body: HTML.html_deposit(deposit)}
    else
      { response_code: 404, body: HTML.html_error('Депозита с таким именем не существует') }
    end
  end
end
