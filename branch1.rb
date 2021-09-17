load 'html.rb'
load 'answer.rb'
module Branch1
    extend HTML
    extend Answer
    PERMITTED_PATHS = ['/', '/deposits/1', '/deposits/2', '/deposits/3'].freeze

    def branch1(socket, path)
        if PERMITTED_PATHS.include?(path)
            if path == '/'
                answer_200(socket, html_menu1)
            elsif path == '/deposits/1'
                answer_200(socket, html_deposit(1,10,10))
            elsif path == '/deposits/2'
                answer_200(socket, html_deposit(2,20,20))
            elsif path == '/deposits/3'
                answer_200(socket, html_deposit(3,30,30))
            else
                answer_404(socket, html_error('Депозита с таким номером нет'))
            end
        else
            answer_400(socket, html_error('Неверно указан путь'))
        end
    end
end