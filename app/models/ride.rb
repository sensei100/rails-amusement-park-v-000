class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def can_ride
    self.user.update(
      tickets: user.tickets - attraction.tickets,
      nausea: user.nausea + attraction.nausea_rating,
      happiness: user.happiness + attraction.happiness_rating
      )
  end

  def take_ride
    case 
      when attraction.tickets > user.tickets && attraction.min_height > user.height
      "Sorry. You do not have enough tickets the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
      when attraction.min_height > user.height 
      "Sorry. You are not tall enough to ride the #{attraction.name}."
      when attraction.tickets > user.tickets
       "Sorry. You do not have enough tickets the #{attraction.name}."
      when user.height >= attraction.min_height && user.tickets >= attraction.tickets
        can_ride

    end
  end

end
