load 'html.rb'
load 'answer.rb'
module Branch2
    extend HTML
    extend Answer
    PERMITTED_PATHS = ['/', '/deps/1', '/deps/2'].freeze

    def branch2(socket, path)
        if PERMITTED_PATHS.include?(path)
            if path == '/'
                answer_200(socket, html_menu2)
            elsif path == '/deps/1'
                answer_200(socket, html_deposit(4,40,40))
            elsif path == '/deps/2'
                answer_200(socket, html_deposit(5,50,50))
            else
                answer_404(socket, html_error('Депозита с таким номером нет'))
            end
        else
            answer_400(socket, html_error('Неверно указан путь'))
        end
    end
end