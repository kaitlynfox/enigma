require './lib/key_manager'

RSpec.describe KeyManager do
  it "exists" do
    one = KeyManager.new("12345")

    expect(one).to be_an(KeyManager)
    expect(two).to be_an(KeyManager)
  end

  it "has a default and class generated random number" do
    one = KeyManager.new("12345")
    two = KeyManager.new

    expect(one.random_number).to eq("12345")
    expect(two.random_number).to be_between("0", "99999")
  end

  it "can create keys based on random number provided or generated" do
    one = KeyManager.new("12345")
    two = KeyManager.new

    expected = {
                  a_key: "12",
                  b_key: "23",
                  c_key: "34",
                  d_key: "45"
                }

    expect(one.keys).to eq(expected)
    expect(one.keys[:a_key]).to eq("12")
    expect(one.keys[:b_key]).to eq("23")
    expect(one.keys[:c_key]).to eq("34")
    expect(one.keys[:d_key]).to eq("45")
    expect(two.keys[:a_key]).to be_between("00", "99")
    expect(two.keys[:b_key]).to be_between("00", "99")
    expect(two.keys[:c_key]).to be_between("00", "99")
    expect(two.keys[:d_key]).to be_between("00", "99")
  end
end
