class JiraQuery
  attr_reader :hash

  def initialize
    @config = ReadConfig.new
    @hash = Hash.new
  end

  def get_json(query)
    @json = GetHttpsJson.new(
      @config.username,
      @config.password,
      @config.search_uri,
      query
    ).json
  end

  def get_issues(query)
    get_json(query)
    @json['issues'].each do |issue|
      issue_key = issue['key']
      issue_hash = Hash.new
      issue['fields'].map do |key,value|
        issue_hash[key] = value if (key == 'summary' || key == 'description')
      end
      @hash[issue_key] = issue_hash
    end
  end

  def get_value(key='total')
    @config.query.each do |query_name,query|
      get_json(query)
      value = @json[key]
      @hash[query_name] = value
    end
  end

  def display_value
    @hash.each do |query_name,value|
      puts "#{query_name}: #{value}"
    end
  end

  def display_release_notes
    @hash.each do |issue,fields|
      puts "#####{fields['summary']}"
      puts "######Jira issue: #{@config.host}/browse/#{issue}"
      puts fields['description']
      puts "\n"
    end
  end

end