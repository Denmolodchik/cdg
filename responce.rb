class Response
  def self.show(responce_code, html)
    <<~HTTP
      HTTP/1.1 #{responce_code} 
      Content-Type: text/html; charset=utf-8 
      Content-Length: #{html.bytesize}
    HTTP
  end
end
