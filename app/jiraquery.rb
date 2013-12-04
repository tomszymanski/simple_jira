class JiraQuery
  def initialize(query = String.new)
    @config = ReadConfig.new
    @hash = Hash.new
    @query_json = GetHttpsJson.new(query).json
    @acceptance_criteria = 
    @empty_release_notes = 'No Release Notes'
  end

  def get_issues
    @query_json['issues'].each do |issue|
      issue_key = issue['key']
      issue_hash = Hash.new
      issue['fields'].each do |key, value|
        issue_hash[key] = value
      end
      @hash[issue_key] = issue_hash
    end
  end

  def get_count(key = 'total')
    @config.query.each do |query_name, query|
      json_result = GetHttpsJson.new(query).json
      @hash[query_name] = json_result[key]
    end
  end

  def display_auto_query
    @hash.each do |query_name, value|
      puts "#{query_name}: #{value}"
    end
  end

  def display_custom_fields(fields)
    @config.custom_fields.each do |custom_fields|
      puts fields[custom_fields[:field_key]] if custom_fields[:display] == true
    end
  end

  def display_project_header(project)
    puts "## #{project}"
    puts "###### #{Time.now.strftime("%b %d, %Y").to_s}"
  end

  def display_issue(issue, fields)
    puts "#### #{fields['summary']}"
    puts "###### Jira issue: [#{issue}](#{@config.host}/browse/#{issue})"
    display_custom_fields(fields)
    puts fields['description']
    puts "\n"    
  end

  def display_release_notes(project)
    unless @hash.empty?
      display_project_header(project)
      @hash.each do |issue, fields|
        display_issue(issue, fields)
      end
    else
      puts @empty_release_notes
    end
  end

end
