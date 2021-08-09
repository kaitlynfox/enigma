require './lib/offset_manager'
require './lib/string'

RSpec.describe OffsetManager do
  it "exists" do
    one = OffsetManager.new("070821")
    two = OffsetManager.new

    expect(one).to be_an(OffsetManager)
    expect(two).to be_an(OffsetManager)
  end

  it "can create a date based on date provided or date generated" do
    one = OffsetManager.new("070821")
    two = OffsetManager.new

    todays_date = Date.today

    expect(one.date).to eq("070821")
    expect(two.date.length).to eq(6)
  end

  it "can format today's date that was generated" do
    two = OffsetManager.new

    # Generate today's date
    todays_date = Date.today

    # Formate today's date as a string
    string = two.format_todays_date(todays_date)

    expect(string.length).to eq(8)
    expect(string).to be_a(String)

    # Check if each character in the formatted date is an integer
    string.split('').each do |character|
      expect(character.is_int?).to eq(true)
    end
  end

  it "can split today's date that was generated" do
    two = OffsetManager.new

    todays_date = Date.today
    string = two.format_todays_date(todays_date)
    array = two.split_formatted_date(string)

    expected =  ["0", "8", "0", "8", "2", "0", "2", "1"]
    size = expected.size

    expect(array.size).to eq(size)
  end

  it "can delete the 2 front year numbers from today's split date" do
    two = OffsetManager.new

    todays_date = Date.today
    string = two.format_todays_date(todays_date)
    array = two.split_formatted_date(string)
    two.delete_beginning_year_numbers(array)

    expected =  ["0", "8", "0", "8", "2", "1"]
    size = expected.size

    expect(array.size).to eq(size)
  end

  it "can join the split date into one date" do
    two = OffsetManager.new

    todays_date = Date.today
    string = two.format_todays_date(todays_date)
    array = two.split_formatted_date(string)
    two.delete_beginning_year_numbers(array)

    expect(two.create_final_date(array)).to be_a(String)
  end

  it "can square the date" do
    two = OffsetManager.new

    todays_date = Date.today
    string = two.format_todays_date(todays_date)
    array = two.split_formatted_date(string)
    two.delete_beginning_year_numbers(array)
    final_date_string = two.create_final_date(array)

    expect(two.square_the_date(final_date_string)).to be_an(Integer)
  end

  it "can get the last four of the squared date" do
    one = OffsetManager.new("070821")
    two = OffsetManager.new

    todays_date = Date.today
    string = two.format_todays_date(todays_date)
    array = two.split_formatted_date(string)
    two.delete_beginning_year_numbers(array)
    final_date_string = two.create_final_date(array)
    squared_date = two.square_the_date(final_date_string)

    expect(one.last_four_of_the_square(squared_date)).to eq("4041")
    expect(two.last_four_of_the_square(squared_date)).to be_a(String)
    expect(two.last_four_of_the_square(squared_date).length).to eq(4)
  end

  it "TEST" do
    one = OffsetManager.new("040895")

    squared_date = one.square_the_date("040895")

    expect(one.last_four_of_the_square(squared_date)).to eq("1025")
  end

  it "can list the offsets" do
    one = OffsetManager.new("070821")
    two = OffsetManager.new

    todays_date = Date.today
    string = two.format_todays_date(todays_date)
    array = two.split_formatted_date(string)
    two.delete_beginning_year_numbers(array)
    final_date_string = two.create_final_date(array)
    squared_date = two.square_the_date(final_date_string)
    last_four = two.last_four_of_the_square(squared_date)

    expected = {
                  a_offset: last_four[0, 1],
                  b_offset: last_four[1, 1],
                  c_offset: last_four[2, 1],
                  d_offset: last_four[3, 1]
                }

    keys = [:a_offset, :b_offset, :c_offset, :d_offset]

    expect(one.offsets).to be_a(Hash)
    expect(one.offsets).to eq(expected)
    expect(two.offsets.keys).to eq(keys)
    expected.values.each do |value|
      expect(value.is_int?).to eq(true)
    end
  end
end
