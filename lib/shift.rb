require './lib/key_manager'
require './lib/offset_manager'

class Shift

  attr_reader :keys,
              :offsets

  def initialize(key_manager, offsets_manager)
    @keys = key_manager.keys
    @offsets = offsets_manager.offsets
  end
end
