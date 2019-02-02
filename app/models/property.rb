class Property < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  belongs_to :user
  has_many :encount
  mount_uploader :image, FloorPlanImageUploader
  def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Property.where(['name LIKE ? OR city LIKE ? OR encount_monster LIKE ? OR town LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      Property.all
    end
  end
    
    validates :name, :city, :town, :postful_code, :postful_code_after, :adress, :after_adress, :rent, :floor_plan, :floor_space, :encount_monster, :stop_count, :stop_adress, :property_age, :image, :image_cache, presence: true

  enum city:{
    千代田: 0,
    中央:1,
    港:2,
    新宿:3,
    文京:4,
    台東:5,
    墨田:6,
    江東:7,
    品川:8,
    目黒:9,
    太田:10,
    世田谷:11,
    渋谷:12,
    中野:13,
    杉並:14,
    豊島:15,
    北:16,
    荒川:17,
    板橋:18,
    練馬:19,
    足立:20,
    葛飾:21,
    江戸川:22,
  }


end
