class VigenereFrequencyCounter
  def initialize fileName
    @words = ""
    @single_letters = Hash.new { |hash, key| hash[key] = 0 }
    @bigram_letters = Hash.new { |hash, key| hash[key] = 0 }
    @trigram_letters = Hash.new { |hash, key| hash[key] = 0 }
    @text = File.read(fileName)
    @text.split(" ").each do |word|
      @words << remove_junk_to_lowercase(word)
    end
    build_single_frequency
    build_bigram_frequency
    build_trigram_frequency
  end

  def show_frequency
    puts @single_letters
    puts @bigram_letters
    puts @trigram_letters
  end

  private

  def remove_junk_to_lowercase word
    output = ""
    word.split("").each do |character|
      if character.ord >= 97 && character.ord <= 122
        output << character
      elsif character.ord >= 65 && character.ord <= 90
        scaled_ascii = character.ord + 32
        output << scaled_ascii.chr
      end
    end
    output << " "
  end

  def build_single_frequency
    @text.split("").each do |letter|
      if is_char? letter
        @single_letters[to_lower(letter)] += 1
      end
    end
    @single_letters = @single_letters.sort_by {|_key, value| value}.reverse.to_h
  end

  def build_bigram_frequency
    @words.split(" ").each do |word|
      if word.length >= 2
        word.length.times do |location|
          unless location + 1 == word.length
            bigram = word[location..location + 1]
            @bigram_letters[bigram] += 1
          end
        end
      end
    end
    @bigram_letters = @bigram_letters.sort_by {|_key, value| value}.reverse.to_h
  end

  def build_trigram_frequency
    @words.split(" ").each do |word|
      puts word
      if word.length >= 3
        word.length.times do |location|
          puts "#{location} - #{location + 2}"
          if location + 2 < word.length
            trigram = word[location..location + 2]
            @trigram_letters[trigram] += 1
          end
        end
      end
    end
    @trigram_letters = @trigram_letters.sort_by {|_key, value| value}.reverse.to_h
  end

  def is_char? character
    return true if (character.ord >= 97 && character.ord <= 122) ||
                    (character.ord >= 65 && character.ord <= 99)
      false
  end

  def to_lower character
    if character.ord >= 97 && character.ord <= 122
      return character
    elsif character.ord >= 65 && character.ord <= 90
      return (character.ord + 32).chr
    end
  end
end

freq = VigenereFrequencyCounter.new "encrypted_stream_2.txt"
freq.show_frequency