

#create anagram
def reverse_letters(two_word_anagram)
  length = two_word_anagram.length-1
  @anagram=Array.new

  two_word_anagram.each_with_index do |i, x|
    @anagram.push(two_word_anagram[length-x])
    end
   @anagram
end
