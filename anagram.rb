require_relative 'reverse_letters'

def find_anagram(word)
  arr=word.split""

  anagram_list=[]

  arr.each_with_index do |i,x|
    newarr=arr.reject{|a| a==i}

    anagram_list << arr[x].to_s + newarr.join("")

    anagram_list << arr[x].to_s + reverse_letters(newarr).join("")
  end
  anagram_list
end


#get users input
puts "What is your word?"
letters = gets.chomp

#output users Anagram
puts "Your Anagram list is:"

puts find_anagram(letters)
