#!/usr/bin/env ruby

require 'json'
require 'yaml'

def change
  output = {
    name: 'Correct pull_request builds',
    branch: 'cultivator/pull_request_target',
    body: 'Build only on main branch and pull requests',
    commit_msg: 'build only on main and PRs',
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

if contents['on']['pull_request']
  contents['on'].delete('pull_request')
  contents['on']['pull_request_target'] == {}
end

if contents['on']['push'] == {}
  contents['on']['push'] == { 'branches' => ['main'] }
end

File.open(file, 'w') do |fh|
  fh << contents.to_yaml
end

change
