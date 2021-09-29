class HTML
  def self.html_deposit(deposit)
    <<~HTML
      <html>
        <link rel="icon" href="data:,">
        <body>
          <h2>Уникальный номер = #{ deposit[:id] }</h2>
          <h2>Количество месяцев = #{ deposit[:months] }</h2>
          <h2>Процент = #{ deposit[:percent] }</h2>
        </body>
      </html>
    HTML
  end

  def self.html_error(string)
    <<~HTML
      <html>
        <link rel="icon" href="data:,">
        <body>
          <h2>#{ string }</h2>\n
        <body>
      </html>
    HTML
  end

  def self.html_form
    <<~HTML
    <html>
      <link rel="icon" href="data:,">
      <body>
      <form action="create" method="POST" enctype = "multipart/form-data">
        Введите условия депозита <br/>
        Количество месяцев: <input type="number" name="months"><br/>
        Проценты: <input type="number" name="precent"><br/>
        <input type = "submit" value = "Добавить депозит"></button>
      </form>
     </body>
    </html>
    HTML
  end
end
