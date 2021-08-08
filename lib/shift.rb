require './lib/key_manager'

class Shift

  attr_reader :keys_hash,
              :offsets_hash

  def initialize(keys_hash, offsets_hash)
    @keys_hash = keys_hash
    @offsets_hash = offsets_hash
  end
end
