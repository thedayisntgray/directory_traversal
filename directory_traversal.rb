#!/usr/bin/env ruby

require 'pathname'
require 'optparse'

def is_text_file?(file_path)
  File.file?(file_path) && !File.zero?(file_path) && `file -b --mime-type "#{file_path}"`.strip.start_with?('text/')
end

def traverse_directory(dir_path, output_file, base_path)
  Dir.foreach(dir_path) do |entry|
    next if entry == '.' || entry == '..'

    full_path = File.join(dir_path, entry)
    relative_path = Pathname.new(full_path).relative_path_from(base_path).to_s

    if File.directory?(full_path)
      traverse_directory(full_path, output_file, base_path)
    elsif is_text_file?(full_path)
      output_file.puts "/#{relative_path}"
      output_file.puts
      File.open(full_path, 'r') do |file|
        output_file.puts file.read
      end
      output_file.puts
    end
  end
end

# Parse command line options
options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: #{File.basename($0)} [options]"

  opts.on("-d", "--directory DIR", "Specify the directory to traverse (default: current directory)") do |dir|
    options[:directory] = dir
  end

  opts.on("-o", "--output FILE", "Specify the output file (default: project_structure_and_content.txt)") do |file|
    options[:output] = file
  end

  opts.on("-h", "--help", "Show this help message") do
    puts opts
    exit
  end
end.parse!

# Set default values
root_directory = options[:directory] || '.'
output_filename = options[:output] || 'project_structure_and_content.txt'

# Open the output file and traverse the directory
File.open(output_filename, 'w') do |output_file|
  traverse_directory(root_directory, output_file, Pathname.new(root_directory))
end

puts "Project structure and content have been written to #{output_filename}"