load 'ShiftCipher.rb'

class VigenereCipher
  def initialize fileName
    # TODO: make this flexible
    # KEYWORD is 'pibis'
    @shifters = [15, 8, 1, 8, 18]
    @text = File.read(fileName)
    @keyword_length = 5
    @count = 0
    @output_text = ""
  end

  def decrypt
    @text.split("").each do |character|
      distance = @shifters[@count % @keyword_length]
      if character.ord >= 97 && character.ord <= 122
        scaled_ascii = character.ord - 97
        scaled_ascii = shift(scaled_ascii, distance)
        scaled_ascii = scaled_ascii + 97
        @output_text << scaled_ascii.chr
        @count += 1
      elsif character.ord >= 65 && character.ord <= 90
        scaled_ascii = character.ord - 65
        scaled_ascii = shift(scaled_ascii, distance)
        scaled_ascii = scaled_ascii + 65
        @output_text << scaled_ascii.chr
        @count += 1
      else
        @output_text << character
      end
    end
    puts @output_text
  end

  private 

  def shift(ascii_integer, offset)
    (ascii_integer - offset) % 26
  end
end

cipher = VigenereCipher.new "encrypted_stream_2.txt"
cipher.decrypt