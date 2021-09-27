class HTML
  def html_deposit(deposit)<<~HTML
    <html>
      <link rel="icon" href="data:,">
      <body>
        <h2>Уникальный номер = #{deposit[:id]}</h2>
        <h2>Количество месяцев = #{deposit[:months]}</h2>
        <h2>Процент = #{deposit[:percent]}</h2>
      </body>
    </html>
    HTML
  end

  def html_error(string)<<~HTML
    <html>
      <link rel="icon" href="data:,">
      <body>
        <h2>#{string}</h2>\n
      <body>
    </html>
    HTML
  end
end
