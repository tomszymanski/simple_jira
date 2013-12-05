class JiraQuery
  def initialize
    @config = ReadConfig.new
    @hash = Hash.new
    @empty_release_notes = 'No Release Notes'
  end

  def get_issues(query)
    query_json = GetHttpsJson.new(query).json

    query_json['issues'].each do |issue|
      issue_key = issue['key']
      issue_hash = Hash.new

      issue['fields'].each do |key, value|
        issue_hash[key] = value
      end

      @hash[issue_key] = issue_hash
    end
    @hash
  end

  def get_count(key = 'total')
    @config.query.each do |query_name, query|
      json_result = GetHttpsJson.new(query).json
      @hash[query_name] = json_result[key]
    end
    @hash
  end
end
