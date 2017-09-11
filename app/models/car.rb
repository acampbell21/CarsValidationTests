class Car < ApplicationRecord
    validates_presence_of :model, :make, :mileage, :price, :age, :color, :interior
    # validations
    # Callbacks
    # Instance Methods
    # Class Methods - scopes

    # Associations
    # Serialize - allows us to save a Hash or Array to column

    def info
        "#{make} #{model} has exterior color of: #{color} "
    end

    def self.by_model
        order(:model)
    end

    def self.by_make
        order(:make)
    end
    

    def self.by_price(high = false)
        order(:price)
    end

    def paint(color)
    end

    def expensive?
        price > 25000

    end

    def old?
        age > 3
        
    end

    def display_car
        "#{make} #{model}"
    end

    def display_state
        "#{age} #{mileage}"
    end
    
    def honk
    end

end
 