class Project
  attr_reader :key

  def initialize(args)  
    project = YAML.load_file('config/project.yml')
    @project = project[:projects]
    @default = project[:defaults]
    @key = args[:project_key]
  end

  def key
    @key ||= @default[:key]
  end

  def release_notes_status
    @release_notes_status = @default[:release_notes_status]
    @project.each do |project|
      if project[:key] == @key
        @release_notes_status = project[:release_notes_status]
      end
    end
    @release_notes_status
  end
end
