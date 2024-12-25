# frozen_string_literal: true

# Run server with `rackup app.ru`
class App
  def call(env)
    [
      200,
      {},
      ["hello"],
    ]
  end
end

run App.new
