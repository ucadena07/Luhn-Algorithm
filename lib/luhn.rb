
module Luhn
  #double every other
  def self.is_valid?(number)
    doubles = []
    digits = number.to_s.split('').map(&:to_i)
    if digits.length.odd?
    	digits.each_with_index do |n, index|
    		if index.odd?
    			dbl_values = n * 2
    			if dbl_values >= 10
    				doubles << dbl_values - 9
    			else
    				doubles << dbl_values
    			end
    		else
    			doubles << n
    		end
    	end
    else
    digits.reverse.each_with_index do |n, index|
      if index.odd?
        	dbl_values = n * 2
    			if dbl_values >= 10
    				doubles << dbl_values - 9
    			else
    				doubles << dbl_values
    			end
      else
        doubles << n
      end 
    end   
    end
    sum = doubles.inject(:+)
    return sum % 10 == 0
  end
 end



puts Luhn.is_valid?(377681478627337)