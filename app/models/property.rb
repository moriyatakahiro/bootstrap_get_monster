class Property < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Property.where(['name LIKE ? OR city LIKE ? OR encount_monster LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      Property.all
    end
  end
    
    validates :name, :city, :town, :postful_code, :adress, :after_adress, :rent, :floor_plan, :floor_space, :encount_monster, :stop_count, :stop_adress, :property_age, presence: true
end
