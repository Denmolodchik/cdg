class HTML
    attr_accessor :html

    def html_deposit(deposit)
        @html = "<html>\r\n"+
          '<link rel="icon" href="data:,">'+
          "<h2>Уникальный номер = #{deposit[:id]}</h1>\r\n"+
          "<h2>Количество месяцев = #{deposit[:months]}</h1>\r\n"+
          "<h2>Процент = #{deposit[:percent]}</h1>\r\n"+
          "</html>"
    end

    def html_string(string)
        @html = "<html>\r\n"+
          '<link rel="icon" href="data:,">'+
          "<h2>#{string}</h2>\r\n"+
          "</html>"
    end
end
