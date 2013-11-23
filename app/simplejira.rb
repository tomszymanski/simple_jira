require 'rubygems'
require 'json'
require 'net/http'
require 'open-uri'
require 'optparse'
require 'yaml'

require_relative 'gethttpsjson'
require_relative 'readconfig'
require_relative 'jiraquery'

case ARGV[0]

  when /^release_notes/i
    project = ARGV.slice(1..-1)
    simple_jira = JiraQuery.new("status='accepted' and project='#{project[0].to_s}'")
    simple_jira.get_issues
    simple_jira.display_release_notes

  when /^auto_query/i
    simple_jira = JiraQuery.new
    simple_jira.get_count
    simple_jira.display_auto_query

end