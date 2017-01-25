current_path = File.expand_path('..', __FILE__)
$LOAD_PATH.unshift(current_path) unless $LOAD_PATH.include?(current_path)

module Hoge
  autoload :Foo, 'loaded'
end

# If uncomment below line, Foo class is autoloaded
# Hoge::Foo.new.foo
