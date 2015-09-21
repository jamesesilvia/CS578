class SubstitutionCipher
  def initialize
    @output_text = ""
  end

  def decrypt fileName
    File.read(fileName).split("").each do |character|
      @output_text << substitute(character)
    end
    puts @output_text
  end

  private

    @@substitution_hash = {
      97 => "h",  #a
      98 => "-",  #b
      99 => "-",  #c
      100 => "i", #d
      101 => "r", #e
      102 => "a", #f
      103 => "j", #g
      104 => "s", #h
      105 => "b", #i
      106 => "k", #j
      107 => "t", #k
      108 => "c", #l
      109 => "l", #m
      110 => "u", #n
      111 => "d", #o
      112 => "m", #p
      113 => "v", #q
      114 => "e", #r
      115 => "n", #s
      116 => "w", #t
      117 => "f", #u
      118 => "o", #v
      119 => "x", #w
      120 => "g", #x
      121 => "p", #y
      122 => "y", #z
    }

  def substitute character
    if character.ord >= 97 && character.ord <= 122
      return @@substitution_hash[character.ord]
    elsif character.ord >= 65 && character.ord <= 90
      temp = character.ord + 32
      temp = @@substitution_hash[temp]
      return (temp.ord - 32).chr
    end
    character
  end
end

substitution = SubstitutionCipher.new
substitution.decrypt "encrypted_stream_1.txt"