class App
  def call(env)
    status = 200
    header = {"Content-Type" => "text/plain"}
    body = ["sample"]

    [status, header, body]
  end
end
