require_relative 'controller2'
require_relative 'base_branch'

class Branch2 < BaseBranch
  PATTERN = /^\/deps\/(?<id>[0-9]+)$/m

  def self.routing(path)
    super
  end

  def self.new_controller
    Controller2.new
  end
end
