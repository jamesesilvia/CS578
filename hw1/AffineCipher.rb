class AffineCipher

  def initialize(a, b)
    @modulus = 26
    @a = a
    @b = b
    @a_inv = extended_gcd(@a, @modulus)
  end

  def decipher ascii_integer
    (@a_inv*(ascii_integer - @b)) % @modulus
  end

  private

  def extended_gcd(b,m,_recursion_depth=0)
    if b % m == 0
      temp = [0,1]
      return temp
    else
      temp = extended_gcd(m, b % m, _recursion_depth+1)
      temp2 = [temp[1], temp[0]-temp[1] * ((b/m).to_i)]
      if _recursion_depth == 0
        return temp2[0] % m
      else
        return temp2
      end
    end
  end
end