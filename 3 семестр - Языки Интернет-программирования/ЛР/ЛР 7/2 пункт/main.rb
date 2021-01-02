# frozen_string_literal: true

# Ill class
class Ill
  def initialize(surname, age)
    @surname = surname
    @age = age
  end

  def write
    puts "Фамилия больного - #{@surname}"
    puts "Возраст - #{@age}"
  end
end

# IllUpgrade class
class IllUpgrade < Ill
  def initialize(surname, age, year)
    super(surname, age)
    @year = year.to_i
  end

  def determine
    puts "Год следующей диспанцеризации - #{@year + 3}"
  end
end
