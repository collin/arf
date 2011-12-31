$LOAD_PATH << "./lib"
require "arf/application"

class Index < Arf::Resources::Page
  def body_content
    h1 "Hello World from ARF!"
  end
end

hello_app = Arf::Application.new

hello_app.router.map :root, [], Index

hello_app.run
