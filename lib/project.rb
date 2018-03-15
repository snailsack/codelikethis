require 'erector'
require 'thing'
require 'views'

class Project < Thing
  def self.projects_dir
    @@projects_dir ||= begin
      app_dir = File.expand_path(File.dirname(File.dirname(__FILE__)))
      File.join(app_dir, "public", "projects")
    end
  end

  attr_reader :optional, :from

  def projects_dir
    @projects_dir || Project.projects_dir
  end

  def content_file
    File.new(File.join(projects_dir, "#{@name}.md"))
  end

  def href
    case from
    when nil
      @href || "/projects/#{name}"
    when 'fcc'
      # TODO: fix FreeCodeCamp itself to allow links to challenges/lessons
      "https://beta.freecodecamp.org/en/challenges/basic-javascript/introduction-to-javascript"
    end
  end

  def icon
    case from
    when 'fcc'
      '/images/fcc-fire-white.png'
    end
  end

  def link_view
    Link::View.new(target: self)
  end

  def view
    View.new(target: self)
  end

  class View < Erector::Widget
    include Views

    needs :target
    attr_reader :target

    def content
      markdown(File.read(target.content_file))
    end
  end

end
