
User.create(:id =>1, :name => "錦織圭", :email => "nishikori@gmail.com", :password => "02160623", :age => 28, :sex => "男", :admin => true)
User.create(:id =>2, :name => "大坂なおみ", :email => "osaka@gmail.com", :password => "02160623", :age => 21, :sex => "女", :admin => false)

Property.create(:images => [File.open("#{Rails.root}/db/fixtures/monster_1.png"),File.open("#{Rails.root}/db/fixtures/monster_2.png")], :name  => '千代田区役所',:postful_code => 102, :town => '富士見', :adress => 17, :after_adress => '1', :property_age => 100, :rent => 50000, :floor_plan => 'hoge', :floor_space => 'hoge', :encount_monster => 'ピカチュウ', :stop_count => 1, :stop_adress => '校舎前にあります', :postful_code_after => 8106, :city => '千代田', :user_id => 1)
