class VigenereCipher
  def initialize fileName
    @words = Hash.new { |hash, key| hash[key] = 0 }
    File.read(fileName).split(" ").each do |word|
      final_word = remove_garbage word
      @words[final_word] += 1
    end
    @words = @words.sort_by {|_key, value| value}.reverse.to_h
    puts @words
  end

  private

  def remove_garbage word
    output = ""
    word.split("").each do |character|
      if character.ord >= 97 && character.ord <= 122
        output << character
      elsif character.ord >= 65 && character.ord <= 90
        output << (character.ord + 32).chr
      end
    end
    output
  end
end

vigenere = VigenereCipher.new "encrypted_stream_2.txt"