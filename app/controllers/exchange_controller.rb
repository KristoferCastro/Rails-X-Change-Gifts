class ExchangeController < ApplicationController
  
  def index
    @people = Santa.all
    @gifts = Gift.all
    @participants = {} # map of name and gift number
    randomize_gift()
  end
  
  def randomize_gift()
    
    number_people = @people.count
    random_tail = number_people-1
    
    current_person = number_people - random_tail - 1
    
    r = Random.new
    
    until random_tail < 0 do
            
      current_person = number_people-random_tail - 1
      
      # now find a gift that is not ours and not already taken
      random_index = r.rand(0..random_tail)
    
      # now assign that gift to the current person
      @participants[ @people[current_person] ] = @gifts[random_index]
      
      swap(random_index, random_tail)
      random_tail -= 1
    end
  end
  
  def swap(number_index, tail_index)
    temp = @gifts[tail_index]
    @gifts[tail_index] = @gifts[number_index]
    @gifts[number_index] = temp
  end
end
