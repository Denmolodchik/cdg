module HTML
    def html_deposit(deposit)
        html = "<html>\r\n"+
          '<link rel="icon" href="data:,">'+
          "<h2>Уникальный номер = #{deposit.id}</h1>\r\n"+
          "<h2>Количество месяцев = #{deposit.months}</h1>\r\n"+
          "<h2>Процент = #{deposit.percent}</h1>\r\n"+
          "</html>"
    end

    def html_string(string)
        html = "<html>\r\n"+
          '<link rel="icon" href="data:,">'+
          "<h2>#{string}</h2>\r\n"+
          "</html>"
    end

    def html_menu(permitted_paths)
        i = 1
        html = "<html>\r\n"+
             '<link rel="icon" href="data:,">'

        permitted_paths.each { |x| html = html + "<a href=#{x}>Депозит #{i}</a></br>" 
            i = i + 1 }

        html = html+"</html>"
    end
end