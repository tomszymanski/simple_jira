class MarkupConfluence
  def self.h1(arg)
    "h1. #{arg}"
  end

  def self.h2(arg)
    "h2. #{arg}"
  end

  def self.h3(arg)
    "h3. #{arg}"
  end

  def self.h4(arg)
    "h4. #{arg}"
  end

  def self.h5(arg)
    "h5. #{arg}"
  end

  def self.h6(arg)
    "h6. #{arg}"
  end

  def self.link(arg)
    "[link #{arg[:title]}|#{arg[:link]}]"
  end
end