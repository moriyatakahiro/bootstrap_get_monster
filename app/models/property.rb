class Property < ApplicationRecord
    validates :name, :city, :town, :postful_code, :adress, :after_adress, :rent, :floor_plan, :floor_space, :encount_monster, :stop_count, :stop_adress, :property_age, presence: true
end
