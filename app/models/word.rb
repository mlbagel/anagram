class Word<ActiveRecord::Base

  before_save :add_letters
  validates_presence_of :text

  def add_letters
    characters = self.text.chars
    alphabetized_characters = characters.sort
    self.letters = alphabetized_characters.join
  end

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
      end
      anagram_list.each do |match|
        if Word.find_by_text(match).present?
          real_words_list << match
        end
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

  def self.distinct_letters?(input)
   letter_array = input.chars
   unique_letters = letter_array.uniq
   if unique_letters.length < letter_array.length
     false
   else
     true
   end
 end

 def self.valid_input(input)
   if Word.find_by_text(input).present? && distinct_letters?(input)
     true
   else
     raise Exception.new("This Word is not in our Dictionary.  Please select 'Add Word' to add this word.")
   end
 end
end

=begin def self.three_letters?(input)
      if input.length == 3
        true
      else
        false
      end
  end


def self.valid_input(input)
 if three_letters?(input) && distinct_letters?(input)
   true
 else
    raise Exception.new("Word must be less than or equal to 3 characters.")
 end
 end

 def self.valid_input?(input)
    if three_letters?(input) && distinct_letters?(input)
      true
    else
      false
    end
  end
=end
