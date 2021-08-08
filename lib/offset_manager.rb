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

# Helper
  def format_todays_date(date)
    date.strftime("%d%m%Y")
  end

# Helper
  def split_formatted_date(date)
    date.split(//)
  end

# Helper
  def delete_beginning_year_numbers(date)
    2.times.map { |i| date.delete_at(4)}
  end

# Helper
  def create_final_date(date)
    date.join
  end

# Offset class
  def square_the_date(date)
    date.to_i * date.to_i
  end

# Offset class
  def last_four_of_the_square(squared_date)
    squared_date.to_s[-4..-1]
  end
end
