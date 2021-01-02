# frozen_string_literal: true

def open_file(file_name)
  array = File.readlines file_name
  File.open('output.txt', 'w') do |file|
    array.each do |str|
      (1..str.length).each do |i|
        if str[i - 1] == 'a'
          file.write(str[i])
        elsif str[i] == "\n"
          file.write(str[i])
        end
      end
    end
  end
end
