class SimpleJiraController  
  def initialize(arg)
    @user_input = arg
    @user_input_hash = {
                        :action => @user_input[0],
                        :project_key => @user_input[1],
                        :optional => @user_input[2]
                       }
    @project = Project.new(@user_input_hash)
    @release_notes_status = (@user_input_hash[:optional] ||= @project.release_notes_status)
  end

  def get_release_notes
    query_string = "status='#{@release_notes_status}' and project='#{@project.key}'"
    jira = JiraQuery.new
    issue_hash = jira.get_issues(query_string)
    display = Display.new(issue_hash)
    display.display_release_notes(@project.key)
  end

  def get_auto_query
    jira = JiraQuery.new
    count_hash = jira.get_count
    display = Display.new(count_hash)
    display.display_auto_query
  end

  def process_arguments
    case @user_input_hash[:action]

    when /^release_notes/i then get_release_notes
    when /^auto_query/i then get_auto_query
    end
  end
end