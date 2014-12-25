class SignupController < ApplicationController
  
  def index
    @santa = Santa.new
    
  end
  
  def submit
      person = params[:name]
      @santa = Santa.find_by name: person
      if @santa == nil 
        @santa = Santa.new 
      end
      
      unless (person == nil || person =~ /^\s*$/) then
        @santa.name = person
        @santa.save
        
        gift = Gift.find_by santa_id: @santa.id
        
        # create a new gift if there isn't one already
        if gift == nil
          gift = Gift.new(message: params[:message], santa_id: @santa.id)
        else #otherwise, update the gift message
          gift.message = params[:message]
        end
        gift.save
        
        flash[:gift] = gift.id      
      else  
        flash[:error] = "Santa must have a non-empty name"
      end
      redirect_to '/signup'
  end
end
