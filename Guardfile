guard :minitest do
  # with Minitest::Unit
  watch(%r{^test/(.+)_test\.rb}) { |m| "test/#{m[1]}_test.rb" }
  watch(%r{^(.+)\.rb}) { |m| "test/#{m[1]}_test.rb" }
end
