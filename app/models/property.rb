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
  #scope :status_search, -> (status) { where(status: status) }
  

  def self.search_city(city)
    area = {"shibuya" => "渋谷", "shinjyuku" => "新宿", "toshima" => "豊島", "tiyoda" => "千代田", "sinagawa" => "品川", "tyu-o" => "中央", "minato" => "港", "nerima" => "練馬", "itabashi" => "板橋", "taito" => "台東", "koto" => "江東", "katsushika" => "葛飾", "meguro" => "目黒", "o-ta" => "大田", "adati" => "足立", "nakano" => "中野", "edogawa" => "江戸川", "bunkyo" => "文京", "setagaya" => "世田谷", "suginami" => "杉並", "kita" => "北", "arakawa" => "荒川", "sumida" => "墨田"}
    Property.where(city: area[city])
  end

  validates :name, :city, :town, :postful_code, :postful_code_after, :after_adress, :rent, :floor_plan, :floor_space, :encount_monster, :stop_count, :stop_adress, :property_age, :images, presence: true

end
