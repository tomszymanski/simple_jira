class Display
  def initialize(arg)
    @issue_hash = arg
    @config = ReadConfig.new
  end

  def display_auto_query
    @issue_hash.each do |query_name, value|
      puts "#{query_name}: #{value}"
    end
  end

  def display_custom_fields(fields)
    @config.custom_fields.each do |custom_fields| 
      puts fields[custom_fields[:field_key]] if custom_fields[:display] == true
    end
  end

  def display_project_header(project)
    puts MarkupGitHub.h2(project)
    puts MarkupGitHub.h6(Time.now.strftime("%b %d, %Y").to_s)
  end

  def display_issue(issue, fields)
    jira_issue_url = "#{@config.host}/browse/#{issue}"

    puts MarkupGitHub.h4(fields['summary'])
    puts MarkupGitHub.h6("JIRA Issue: " + MarkupGitHub.link({:title => issue, :link => jira_issue_url}))
    display_custom_fields(fields)
    puts fields['description']
    puts "\n"    
  end

  def display_release_notes(project)
    unless @issue_hash.empty?
      display_project_header(project)
      @issue_hash.each do |issue, fields|
        display_issue(issue, fields)
      end
    else
      puts @empty_release_notes
    end
  end
end
