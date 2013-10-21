require 'rubygems'
require 'json'
require 'open-uri'
require 'net/http'
require 'yaml'

require_relative 'gethttpsjson'
require_relative 'readconfig'
require_relative 'valuefromquery'

class SimpleJira
  def initialize
    simple_jira = ValueFromQuery.new
    simple_jira.get_value
    simple_jira.display_value
  end
end

SimpleJira.new