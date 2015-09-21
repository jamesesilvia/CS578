load 'AffineCipher.rb'

class DecryptAffineCipherFromTextFile
  def initialize fileName
    @text = File.read(fileName)
    @output_text = ""
  end

  def affine_cipher(a, b)
    @text.split("").each do |character|
      affine_decrypt(character, a, b)
    end
    puts @output_text[0...30]
  end

  private

  def affine_decrypt(character, a, b)
    affine = AffineCipher.new(a, b)
    if character.ord >= 97 && character.ord <= 122
      scaled_ascii = character.ord - 97
      scaled_ascii = affine.decipher scaled_ascii
      scaled_ascii = scaled_ascii + 97
      @output_text << scaled_ascii.chr
    elsif character.ord >= 65 && character.ord <= 90
      scaled_ascii = character.ord - 65
      scaled_ascii = affine.decipher scaled_ascii
      scaled_ascii = scaled_ascii + 65
      @output_text << scaled_ascii.chr
    else
      @output_text << character
    end
  end
end

# # Brute Force Affine Cipher
# puts "Problem 1"
# 1.step(26,2) do |a|
#   26.times do |b|
#     decryptor = DecryptAffineCipherFromTextFile.new "encrypted_stream_1.txt"
#     decryptor.affine_cipher(a, b)
#   end
# end

# puts
# puts "Problem 2"
# 1.step(26,2) do |a|
#   26.times do |b|
#     decryptor = DecryptAffineCipherFromTextFile.new "encrypted_stream_2.txt"
#     decryptor.affine_cipher(a, b)
#   end
# end