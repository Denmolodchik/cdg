require_relative 'controller2'
require_relative 'base_branch'

class Branch2 < BaseBranch
  PATTERN = /\A(?<first_part>deps)\/(?<second_part>[a-z0-9]+)\z/m

  def self.new_controller
    Controller2.new
  end
end
