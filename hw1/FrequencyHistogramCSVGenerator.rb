class FrequencyHistogramCSVGenerator
	 def initialize fileName
	 	@text = ""
	 	@count = 0
   	@text = File.read(fileName)
  end

  def create_histograms keyword_length
  	@keyword_length = keyword_length
  	build_histogram_hash
  	save_histogram_to_file
  end

  private

  def build_histogram_hash
	 	@histogram = Array.new(@keyword_length){Array.new(26, 0)}
	 	@text.split("").each do |character|
	 		save character
	 	end
	 end

  def save character
  	if character.ord >= 97 && character.ord <= 122
  		temp = character.ord - 97
  		@histogram[@count % @keyword_length][temp] += 1
  		@count += 1
  	elsif character.ord >= 65 && character.ord <= 99
  		temp = character.ord - 65
  		@histogram[@count % @keyword_length][temp] += 1
  		@count += 1
  	end
  end

  def save_histogram_to_file
  	@file = File.open("histograms.csv", "w")
  	26.times do |letter|
  		string = ""
  		char = (letter + 65).chr
  		string << "#{char},"
  		@keyword_length.times do |index|
  			count = @histogram[index][letter]
  			string << "#{count},"
  		end
  		@file.write("#{string}\n")
  	end
  	@file.close
  end
end
generator = FrequencyHistogramCSVGenerator.new "encrypted_stream_2.txt"
generator.create_histograms 5