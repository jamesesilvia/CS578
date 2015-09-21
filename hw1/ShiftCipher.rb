class ShiftCipher
  def initialize(offset)
    @modulus = 26
    @offset = offset
  end

  def decipher ascii_integer
    (ascii_integer + @offset) % @modulus
  end
end