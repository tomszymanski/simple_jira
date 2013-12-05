class MarkupGitHub
  def self.h1(arg)
    "# #{arg}"
  end

  def self.h2(arg)
    "## #{arg}"
  end

  def self.h3(arg)
    "### #{arg}"
  end

  def self.h4(arg)
    "#### #{arg}"
  end

  def self.h5(arg)
    "##### #{arg}"
  end

  def self.h6(arg)
    "###### #{arg}"
  end

  def self.link(arg)
    "[#{arg[:title]}](#{arg[:link]})"
  end
end