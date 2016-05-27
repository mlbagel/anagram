require_relative 'reverse_letters'

def find_anagram(word)
  arr=word.split""

  anagram_list=[]

  arr.each_with_index do |i,x|
    newarr=arr.reject{|a| a==i}

    anagram_list.push(arr[x].to_s + newarr.join(""))

    reverse_letters(newarr)

    anagram_list.push(arr[x].to_s + @anagram.join(""))
  end
  return anagram_list
end


#get users input
puts "What is your word?"
letters = gets.chomp

#output users Anagram
puts "Your Anagram list is:"

puts find_anagram(letters)
