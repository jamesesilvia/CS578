load 'ShiftCipher.rb'

class DecryptShiftCipherFromTextFile
  def initialize fileName
    @text = File.read(fileName)
    @output_text = ""
  end

  def shift_cipher(n)
    @text.split("").each do |character|
      shift_decrypt(character, n)
    end
    puts @output_text[0...30]
  end
  
  private

  def shift_decrypt(character, n)
    shifter = ShiftCipher.new(n)
    if character.ord >= 97 && character.ord <= 122
      scaled_ascii = character.ord - 97
      scaled_ascii = shifter.decipher scaled_ascii
      scaled_ascii = scaled_ascii + 97
      @output_text << scaled_ascii.chr
    elsif character.ord >= 65 && character.ord <= 90
      scaled_ascii = character.ord - 65
      scaled_ascii = shifter.decipher scaled_ascii
      scaled_ascii = scaled_ascii + 65
      @output_text << scaled_ascii.chr
    else
      @output_text << character
    end
  end
end

# # Brute Force Shift Cipher
# puts "Problem 1"
# 26.times do |offset|
#   decryptor = DecryptShiftCipherFromTextFile.new "encrypted_stream_1.txt"
#   decryptor.shift_cipher offset
# end

# puts
# puts "Problem 2"
# 26.times do |offset|
#   decryptor = DecryptShiftCipherFromTextFile.new "encrypted_stream_2.txt"
#   decryptor.shift_cipher offset
# end