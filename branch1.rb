require_relative 'controller1'
require_relative 'base_branch'

class Branch1 < BaseBranch
  PATTERN = /\A\/deposits\/(?<id>[0-9]+)\z/

  def self.new_controller
    Controller1.new
  end
end
