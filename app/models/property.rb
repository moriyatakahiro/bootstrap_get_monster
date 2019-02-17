class Property < ApplicationRecord
  validates :postful_code, length: { is: 3 }
  validates :postful_code_after, length: { is: 4 }
  validates :property_age, length: { maximum: 2 }
  validates :stop_count, length: { maximum: 2 }
  validates :city, length: { maximum: 3 }
  validates :city, length: { maximum: 5 }
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  belongs_to :user
  mount_uploaders :images, FloorPlanImageUploader
  scope :status_search, -> (status) { where(status: status) }

def self.search(search, money)
    if search && search != ""
      words = search.to_s.split(" ")
      columns = ["name", "town", "encount_monster", "city",  "cast(stop_count as text)", "floor_plan", "cast(property_age as text)"]
      query = []
      result = []

      columns.each do |column|
        query << ["#{column} LIKE ?"]     
      end
      
    if search && money
      words.each_with_index do |w, index|
        if index == 0
          puts "あああ#{query.join(" OR ")} AND rent <= ?"
          aaa = "#{query.join(" OR ")} AND rent <= ?"
          #result[index] = Property.where(['query.join(" OR ") AND rent <= ?', "%#{w}%",  "%#{w}%", "%#{w}%", "%#{w}%", "%#{w}%", "%#{w}%", "%#{w}%", "#{money}"])
          result[index] = Property.where(["#{aaa}", "%#{w}%",  "%#{w}%", "%#{w}%", "%#{w}%", "%#{w}%", "%#{w}%", "%#{w}%", "#{money}"])
        else
          result[index] = result[index-1].where(["#{aaa}", "%#{w}%",  "%#{w}%", "%#{w}%", "%#{w}%", "%#{w}%", "%#{w}%", "%#{w}%", "#{money}"])
        end
      end
      return result[words.length-1]
    else
      Property.all
    end
    end
end



  
    #elsif search
      #words.each_with_index do |w, index|
        #if index == 0
          #result[index] = Property.where([query.join(" OR "), "%#{w}%",  "%#{w}%", "%#{w}%", "%#{w}%", "%#{w}%", "%#{w}%", "%#{w}%", "%#{w}%"])
        #else
          #result[index] = result[index-1].where([query.join(" OR "), "%#{w}%",  "%#{w}%", "%#{w}%", "%#{w}%", "%#{w}%", "#{w}%", "%#{w}%", "%#{w}%"])
        #end
      #end
      #return result[words.length-1]
    #else
      #Property.all
    #end
#end


 


  def self.search_city(city)
    area = {"shibuya" => "渋谷", "shinjyuku" => "新宿", "toshima" => "豊島", "tiyoda" => "千代田", "sinagawa" => "品川", "tyu-o" => "中央", "minato" => "港", "nerima" => "練馬", "itabashi" => "板橋", "taito" => "台東", "koto" => "江東", "katsushika" => "葛飾", "meguro" => "目黒", "o-ta" => "大田", "adati" => "足立", "nakano" => "中野", "edogawa" => "江戸川", "bunkyo" => "文京", "setagaya" => "世田谷", "suginami" => "杉並", "kita" => "北", "arakawa" => "荒川", "sumida" => "墨田"}
    Property.where(city: area[city])
  end

  validates :name, :city, :town, :postful_code, :postful_code_after, :after_adress, :rent, :floor_plan, :floor_space, :encount_monster, :stop_count, :stop_adress, :property_age, :images, presence: true

end
