#def check_regex(word)
#  word =~ (/[A-Z][\d]/)
#end
#
#check_regex("A2")
#check_regex("hello")
#check_regex(25)
#check_regex("25")

#def answer_key
#  {
#    "1" => 0,
#    "2" => 1,
#    "3" => 2,
#    "4" => 3,
#    "5" => 4,
#    "6" => 5,
#    "A" => 0,
#    "B" => 1,
#    "C" => 2,
#    "D" => 3,
#    "E" => 4,
#    "F" => 5
#  }
#end
#
#puts answer_key.keys.include?("B")

#array1 = ["A", "B", "C", "D"]
#array2 = [1, 2, 3, 4]
#
#class Person
#
#define_method("answer_key") do |argument|
#  Hash[argument.collect.with_index { |item, index| [item, index] } ]
#end
#
#end
#
#me = Person.new
#puts me.answer_key(array1).merge(me.answer_key(array2))
#puts me.answer_key(array2)
#header_array = ("A".."F").to_a
#header2_array = (1..6).to_a
#hash = Hash[header_array.collect.with_index { |item, index| [item, index] } ]
#hash2 = Hash[header2_array.collect.with_index { |item, index| [item, index] } ]
#p hash.merge(hash2)

#gets.chomp
#
#if $_ == "hello\n"
#  puts "hey!"
#else
#  puts "You there?"
#end

#array = ["1233.00", "125", "Hardware", "24.8", "123", "Flowers", "93.5", "127"]
#array.each do |item|
#  if item.includes?(".")
#    puts "Yes!"
#  else
#    puts "Nope"
#  end
#end

#answer = gets.chomp.downcase
#
#if answer == "yes" || answer == "maybe" || answer == "okay" || answer == "sure"
#  puts "If conditional returns true"
#else
#  puts "If conditional returns false"
#end
#
#if ["yes", "maybe", "okay", "sure"].include?(answer)
#  puts "Array.include returns true"
#else
#  puts "Array.include returns false"
#end
#
#case answer
#when "yes", "maybe", "okay", "sure"
#  puts "Case statement returns true"
#else
#  puts "Case statement returns false"
#end
#

add = lambda { |a, b| return b }
add_again = proc { |a, b| return b }

p add.call(1, 2)
p add_again.call(1, 2)
