class JiraQuery
  def initialize(query = String.new)
    @config = ReadConfig.new
    @hash = Hash.new
    @query_json = GetHttpsJson.new(query).json
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

  def display_release_notes(project)
    puts "## #{project}"
    puts "###### #{Time.now.strftime("%b %d, %Y").to_s}"
    @hash.each do |issue, fields|
      puts "#### #{fields['summary']}"
      puts "###### Jira issue: #{@config.host}/browse/#{issue}"
      puts fields['description']
      puts "\n"
    end
  end

end
