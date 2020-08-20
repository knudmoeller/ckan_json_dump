# coding: utf-8

require 'json'
require 'logger'
require 'net/https'
require 'optparse'
require 'time'
require 'uri'

# Send an HTTP request, interprete response as JSON
# and return as Ruby object.
#
# +uri+:: Where to send the request
def get_data(uri)
  uri = URI(uri)
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = (uri.scheme == "https")
  json = ""

  http.get(uri) do |chunk|
      json += chunk
  end

  response = JSON.parse(json)
  return response['result']
end

options = {}
logger = Logger.new(STDOUT)

usage = "Usage: ruby #{ __FILE__} [options]"
OptionParser.new do |opts|
    opts.banner = usage
    opts.separator ""
    opts.separator "Options:"

    opts.on("-s", "--source STRING", String, "Required: The source CKAN URI (e.g., https://datenregister.berlin.de).") do |source|
        options[:source] = source
    end

    opts.on("-t", "--target STRING", String, "Required: The target JSON file.") do |target|
        options[:target] = target
    end
end.parse!

# make options required
if !options.include?(:source) || !options.include?(:target)
    puts "You need to specify --source and --target options."
    exit
end

container = {
  :source => options[:source] ,
  :dump_started => Time.now.iso8601
}
dataset_dump = Array.new
datasets = get_data(File.join(options[:source], "api/3/action/package_list"))

total = datasets.count
index = 1

datasets.each do |dataset|
  full_path = File.join(options[:source], "api/3/action/package_show?id=#{dataset}")
  logger.info "#{index.to_s.rjust(4, '0')} of #{total.to_s.rjust(4, '0')}: #{full_path}"
  data = get_data(full_path)
  dataset_dump << data
  index += 1
end

container[:dump_finished] = Time.now.iso8601
container[:datasets] = dataset_dump

output = JSON.pretty_generate(container)
File.open(options[:target], 'wb') do |file|
  file.write(output)
end
