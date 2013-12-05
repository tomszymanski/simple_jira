require 'rubygems'
require 'json'
require 'net/http'
require 'open-uri'
require 'openssl'
require 'optparse'
require 'yaml'

require_relative 'display'
require_relative 'gethttpsjson'
require_relative 'jiraquery'
require_relative 'project'
require_relative 'readconfig'
require_relative 'simplejiracontroller'
require_relative 'decorators/markup_github'
require_relative 'decorators/markup_confluence'

@simple_jira = SimpleJiraController.new(ARGV)
@simple_jira.process_arguments
