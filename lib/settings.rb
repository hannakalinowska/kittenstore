require "yaml"
Settings ||= YAML.load_file(File.expand_path("../../config/application.yml", __FILE__))
