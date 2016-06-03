class Word<ActiveRecord::Base

  def self.find_anagrams(string)
    #convert word to an array of letters
      arr=string.split""

      anagram_list=[]

      arr.each_with_index do |i,x|
        extra_letters=arr.reject{|a| a==i}

        anagram_list << arr[x].to_s + extra_letters.join("")

        anagram_list << arr[x].to_s + reverse_letters(extra_letters).join("")

      real_words_list = []
      anagram_list.each do |match|
        if Word.find_by_text(match).present?
          real_words_list << match
        end
      end
    end
      anagram_list
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
