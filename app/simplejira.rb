require 'rubygems'
require 'json'
require 'net/http'
require 'open-uri'
require 'optparse'
require 'yaml'

require_relative 'gethttpsjson'
require_relative 'readconfig'
require_relative 'jiraquery'

simple_jira = JiraQuery.new

case ARGV[0]

  when /^release_notes/i
    project = ARGV.slice(1..-1)
    simple_jira.get_issues(project[0].to_s)
    simple_jira.display_release_notes

  when /^auto_query/i
    simple_jira.get_value
    simple_jira.display_value

end