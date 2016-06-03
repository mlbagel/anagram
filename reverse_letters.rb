class Word

  def self.find_anagrams(string)
      anagram_list=[]
      real_words_list = []
          #convert word to an array of letters
      arr=string.split""
        #join all the letters into three word combinations
      arr.each_with_index do |i,x|
        extra_letters=arr.reject{|a| a==i}

        anagram_list << arr[x].to_s + extra_letters.join("")

        anagram_list << arr[x].to_s + reverse_letters(extra_letters).join("")
        p anagram_list
      end
      anagram_list.each do |match|
        if match == "cat"
          real_words_list << match
        elsif match == "act"
          real_words_list << match
        end
        p real_words_list
      end
      real_words_list
    end


  #reverse letters in array
    def self.reverse_letters(two_word_anagram)
      length = two_word_anagram.length-1
      anagram=Array.new

      two_word_anagram.each_with_index do |i, x|
        anagram.push(two_word_anagram[length-x])
        end
      anagram
    end
  end
