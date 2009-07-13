#!/usr/bin/env ruby

class Converter
  
  def initialize
    # Data, s ktorymi pracuje funkcia.
    # @first - cislovky 0..20
    @first = ["zero","one","two","three","four","five","six","seven","eight","nine","ten","eleven","twelve","thirdteen","fourteen","fifteen","sixteen","seventeen","eighteen","nineteen"]
    # @decimals - desiatky 0 - 90
    @decimals = ["zero","ten","twenty","thirty","fourty","fifty","sixty","seventy","eighty","ninety"]
    # @teen_exceptions - pomocou aritmetickej postupnosti dostaneme cisla, na ktorych sa vyskytuju vynimky v rozmedzi 10 - 19
    #                  - to znamena ze ked mam cislo 11111 = eleven thousand one hundred eleven
    #                  - tak vynimky su na poziciach jednotiek a tisicok
    #                  - ak narazim na poziciu s vynimkou spytam sa ci dalsia pozicia je 1 ak hej tak s tychto dvoch pozicii spravim cislo v rozmedzi 10 -19, bez toho by mi to vypisalo 11111 = ten one thousand one hundred ten one 
    @teen_exceptions = []
    n = 1
    10.times do 
      @teen_exceptions << 3*n - 2 # aritmeticka postupnost
      n += 1
    end
    # @words - pole obsahujuce zakladne slova, s ktorych skladam zvysok
    @words = [nil, @first, @decimals]
    # @endings - koncovky, ktore sa pripajaju k jednotlivym poziciam cisla
    @endings = {3 => " hundred", 4 => " thousand", 6 => " hundred", 7 => " milion", 9 => " hundred", 10 => " bilion", 12 => " hundred",13 => " trilion"}
    # @endings_exceptions - vynimky v koncovkach napr. 100000 - one hundred thousand
    #                     - ak by to tam nebolo tak by to bolo len one hundred
    @ending_exceptions = {6 => " thousand", 9 => " milion", 12 => " bilion"}
    # Teoreticky sa to da rozsirovat do nekonecna len treba pridat spravne koncovky do @endings a @endings_exceptions a 
    # v podmienke povolit vacsie cisla. Jasne ze treba aj upravit testy.
  end
    # hlavna metoda  
  def convert_number_to_words(number)
    # zistim ci dany input je cislo 
    case number.class.to_s
    when "String"
      string = "This is not a number! Please enter an integer from 0 to 9999999999!"
    
    when "Float"
      string = "This is not an integer! Please enter an integer from 0 to 9999999999!"
    
    when
      if "Integer" or "Bignum" then
        # zistim ci dane cislo nie je vacsie ako max mozne
        # ak zvisujeme hranicu treba zvisit aj toto cislo
        if number.to_s.size > 10 then
          string = "The integer is too large please enter an integer from 0 to 9999999999!"
        # cisla do 19 riesim priamo, zo zakladnych slov
        elsif number < 20 then
          string = @first[number]
        # cisla od 20 a vyssie az po max hranicu
        elsif number >= 20 then
          
          size = number.to_s.size # velkost cisla
          position = 1 # zakladna pozicia na jednotkach
          string = [] # pole slov, ktore bude obsahovat cele cislo
          
          # iterujem kazdu poziciu v cisle
          while position < (size + 1)
            
            # ak sa dana pozicia nachadza vo vynimkach a susedna pozicia je jedna tak
            # vytvory sa cislo od 10 do 19. A pozicia sa posunie o dva policka.
            if @teen_exceptions.include?(position) and get_integer(number, (position + 1)) == 1 then
              
              value = "#{get_integer(number, (position + 1))}#{get_integer(number, position)}".to_i
              string << "#{@words[1][value]}#{@endings[position]}"
              position += 2
              
            else
            # ak dana pozicia nema slovo tak ho musime posladat, cisla nad 99
              if @words[position] == nil then 
                # z pozicie dostaneme cislo
                value_1 = get_integer(number, position)
                # poskladame slovo pomocou slov, ktore mame k dispozicii
                string << "#{@words[if @endings[position] != nil then 1 else 2 end][value_1]}#{@endings[position]}#{@ending_exceptions[position] if get_integer(number, (position - 1)) == 0 and get_integer(number, (position - 2)) == 0}"
                                
                position += 1
                
              else
                # tu sa riesia slova do 99
                value = get_integer(number, position)
                string << @words[position][value]
                position += 1
              
              end
            end
          end
          # vsade kde sa v cisle vyskytuje 0 tak sa prepise na zero. Tieto slova zo zero sa zmazu
          string.delete_if{|i| i =~ /zero*/}
          # musim si pole prehodit a pospajat jednotlive polozky do stringu.
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
