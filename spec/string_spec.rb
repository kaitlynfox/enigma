require './lib/string'

RSpec.describe String do
  it "can tell if a string is an Integer" do

    string_1 = "123"
    string_2 = "abc"

    expect(string_1.is_int?).to eq(true)
    expect(string_2.is_int?).to eq(false)
  end
end
