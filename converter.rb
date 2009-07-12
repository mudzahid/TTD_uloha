#!/usr/bin/env ruby

class Converter
  
  def initialize
    # Data, s ktorymi pracuje funkcia.
    # @first - cislovky 0..20
    @first = ["zero","one","two","three","four","five","six","seven","eight","nine","ten","eleven","twelve","thirdteen","fourteen","fifteen","sixteen","seventeen","eighteen","nineteen"]
    # @decimals - desiatky 0 - 90
    @decimals = ["zero","ten","twenty","thirty","fourty","fifty","sixty","seventy","eighty","ninety"]
    # @cents - stovky
    @cents = ["zero", "one hundred","two hundred","three hundred","four hundred","five hundred","six hundred","seven hundred","eight hundred","nine hundred"]
    @thousands = ["zero", "one thousand","two thousand","three thousand","four thousand","five thousand","six thousand","seven thousand","eight thousand","nine thousand"]
    @teen_exceptions = []
    n = 1
    10.times do 
      @teen_exceptions << 3*n - 2
      n += 1
    end
    @words = [nil, @first, @decimals, @cents, @thousands]
  end
    
  def convert_number_to_words(number)
    
    case number.class.to_s
    when "String"
      string = "This is not a number! Please enter an integer from 0 to 9999!"
    
    when "Float"
      string = "This is not an integer! Please enter an integer from 0 to 9999!"
    
    when
      if "Integer" or "Bignum" then
        
        if number.to_s.size > 10 then
          string = "The integer is too large please enter an integer from 0 to 9999!"
        elsif number < 20 then
          string = @first[number]
        elsif number >= 20 then
          
          size = number.size
          position = 1
          string = []
          
          while position < (size + 1)
            
            if @teen_exceptions.include?(position) and get_integer(number, (position + 1)) == 1 then
              
              value = "#{get_integer(number, (position + 1))}#{get_integer(number, position)}".to_i
              string << @words[1][value]
              position += 2
              
            else
              if @words[position] == nil then 
              
                
              else
                value = get_integer(number, position)
                string << @words[position][value]
                position += 1
              
              end
            end
          end
          
          string.delete_if{|i| i == "zero"}
          string = "#{string.reverse.map{|i| i+" "}}".chop
        
        end
        
      end
      
    end
        
    return string
  
  end
  
  def get_integer(number, position)
    ("%c" % number.to_s[-position] if number.to_s[-position] != nil ).to_i
  end
  
end
