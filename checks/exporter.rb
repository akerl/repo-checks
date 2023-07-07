#!/usr/bin/env ruby

require 'json'
require 'yaml'

def change
  output = {
    name: 'Only export on main branch',
    branch: 'cultivator/exporter',
    body: 'Only export on main branch',
    commit_msg: 'only export on main branch',
  }
  print output.to_json
end

file = '.github/workflows/build.yml'

if !File.exist?(file)
  change
  exit 0
end

src = YAML.parse(File.read(file))
src.select{ |node| node.is_a?(Psych::Nodes::Scalar) && %w(on off).include?(node.value) }.each{|node| node.quoted = true }

contents = src.to_ruby

contents['jobs']['build']['steps'][-1]['if'] = "always() && github.ref == 'refs/heads/main'"

File.open(file, 'w') do |fh|
  fh << contents.to_yaml
end

change
