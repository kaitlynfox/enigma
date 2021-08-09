class OffsetManager

  attr_reader :date

  def initialize(date = generate_todays_date)
    @date = date
  end

# Generate today's date if no date passed in
  def generate_todays_date
    todays_date = Date.today
    todays_formatted_date = format_todays_date(todays_date)
    split_date = split_formatted_date(todays_formatted_date)
    delete_beginning_year_numbers(split_date)
    create_final_date(split_date)
  end

  def format_todays_date(date)
    date.strftime("%d%m%Y")
  end

  def split_formatted_date(date)
    date.split(//)
  end

  def delete_beginning_year_numbers(date)
    2.times.map { |i| date.delete_at(4)}
  end

  def create_final_date(date)
    date.join
  end

  def square_the_date(date)
    date.to_i * date.to_i
  end

  def last_four_of_the_square(squared_date)
    squared_date.to_s[-4..-1]
  end

  def offsets
    squared_date = square_the_date(@date)
    last_four = last_four_of_the_square(squared_date)
    # A Offset: First digit (4)
    # B Offset: Second digit (0)
    # C Offset: Third digit (4)
    # D Offset: Fourth digit (1)
    hash = {
              a_offset: last_four[0, 1],
              b_offset: last_four[1, 1],
              c_offset: last_four[2, 1],
              d_offset: last_four[3, 1]
            }
  end
end
