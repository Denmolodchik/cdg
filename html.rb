module HTML
    def html_deposit(id, months, percent)
        html = "<html>\r\n"+
          '<link rel="icon" href="data:,">'+
          "<h2>Уникальный номер = #{id}</h1>\r\n"+
          "<h2>Количество месяцев = #{months}</h1>\r\n"+
          "<h2>Процент = #{percent}</h1>\r\n"+
          "</html>"
    end

    def html_error(error)
        html = "<html>\r\n"+
          '<link rel="icon" href="data:,">'+
          "<h2>#{error}</h2>\r\n"+
          "</html>"
    end

    def html_menu1
      html = "<html>\r\n"+
             '<link rel="icon" href="data:,">'+
             '<a href="/deposits/1">Депозит 1</a></br>'+
             '<a href="/deposits/2">Депозит 2</a></br>'+
             '<a href="/deposits/3">Депозит 3</a></br>'+
             "</html>"
    end

    def html_menu2
      html = "<html>\r\n"+
             '<link rel="icon" href="data:,">'+
             '<a href="/deps/1">Депозит 1</a></br>'+
             '<a href="/deps/2">Депозит 2</a></br>'+
             "</html>"
    end
end