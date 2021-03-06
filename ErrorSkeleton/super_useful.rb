# PHASE 2

class CoffeeError < StandardError; end
class AgeError < StandardError; end
class ExtraError < StandardError; end
require "byebug"

def convert_to_int(str)
  Integer(str)
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  

  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == 'coffee'
    raise CoffeeError.new("I like coffee, so you get another chance. But that's not a fruit")
  else
    raise StandardError 
  end 
end

def feed_me_a_fruit
  
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  
  begin
    maybe_fruit = gets.chomp
    reaction(maybe_fruit) 
  rescue CoffeeError => e
      puts e.message
      retry
  rescue StandardError
  end
  
 

end  

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise AgeError.new("You need to have known each other for at least 5 years") if yrs_known < 5
    raise StandardError.new("You're missing a name!") if name == ""
    raise StandardError.new("You're missing a hobby!") if fav_pastime == ""
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known} years. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


