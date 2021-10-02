require_relative 'controller1'
require_relative 'base_branch'

class Branch1 < BaseBranch
  PATTERN = /\A(?<first_part>deposits)\/(?<second_part>[a-z0-9]+)\z/

  def self.new_controller
    Controller1.new
  end
end
