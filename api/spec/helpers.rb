
module Helpers
 def get_fixures(item)
  YAML.load(File.read(Dir.pwd + "/spec/fixtures/#{item}.yml"), symbolize_names: true)
 end
 module_function :get_fixures
end