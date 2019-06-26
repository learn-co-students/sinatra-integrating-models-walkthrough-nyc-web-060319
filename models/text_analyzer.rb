# Your TextAnalyzer model code will go here.
class TextAnalyzer
    attr_reader :text
  
    def initialize(text)
      @text = text.downcase
    end
  
    def count_of_words
      words = text.split(" ")
      words.count
    end
  
    def count_of_vowels
      text.scan(/[aeoui]/).count
    end
  
    def count_of_consonants
      text.scan(/[bcdfghjklmnpqrstvwxyz]/).count #look for any characters that are not vowels, and count them
    end
  
    def most_used_letter
      s1 = text.gsub(/[^a-z]/, '') # [^] in character class = any character that is NOT a-z, gets rid of spaces
      arr = s1.split('') #Split a string into individual letters ["h", "e", "l", "l", "o"]
      arr1 = arr.uniq #Make that array unique ["h", "e", "l", "o"]
      arr2 = {} #An empty hash that is about to get filled
  
      arr1.map do |c| #Take the unique array, make a new array from its data by...
        arr2[c] =  arr.count(c)#...Set key in {} to an element of that array, with its value equal to the # of times a letter is in the split, NON-unique arr 
      end #Remember this is map, so an ARRAY is returned, which is useless to us. This should've been a .each method
  
      #^ A uniq arr of letters [h,e,l,o] is compared to an non-uniq array from beforehand [h,e,l,l,o]
      # First iteration of map:
      # H is compared to the count of H in [H,e,l,l,o] --> {"h" => 1}
      # Same exact process for second iteration "e" --> {"h" => 1, "e" => 1}
      # Third iteration of map: (This one is interesting because there are two l's)
      # l is compared to count of l in [h,e,l,l,o] --> {"h" => 1, "e" => 1, "l" => 2}
      # End result: [1,1,2,1] (useless, this should've been a .each function) and {"h"=>1, "e"=>1, "l"=>2, "o"=>1}   

      #         {        "h"      =>       1           }
      biggest = { arr2.keys.first => arr2.values.first } #The first key and value pair of ar2 (can't do arr2.first because that gives ["h", 1])
                                                         # which would make data extraction more complicated
  
      arr2.each do |key, value| #Look through each key-value pair of hash
        if value > biggest.values.first #Is the value in arr2 larger the value in biggest (1)?
          biggest = {} #If so, reset biggest to {}
          biggest[key] = value #Then add a key-value pair to biggest that is the current key-value pair being looked at in arr2
        end
      end
      
      biggest #Returns an updated biggest hash where the key is the letter with the most occurences
              #and the value is the number of those occurences
    end
  end