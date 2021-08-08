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
end
