#!/usr/bin/env ruby

require 'json'

f = File.readlines('sample.txt')
f.map! { |line| line.strip }
group_start = Array.new
group_end = Array.new

f.each_with_index do |value, index|
  group_start << index if value == 'BEGIN_GROUP'
  group_end << index if value == 'END_GROUP'
end

parsed_document = {}

group_start.each_with_index do |value, index|
  puts "#{value} | #{group_end[index]}"
  i = value
  j = group_end[index]

  group = Array.new
  (f[i...j]).each do |line|
    group << line
  end
  parsed_document[index] = group
end

#file_json = f.to_json

#puts file_json

p group_start
p group_end
#p group
p parsed_document
