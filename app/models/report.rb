class Report < ApplicationRecord
    mount_uploader :image, ImageUploader
    validates :title, presence: true
    validates :content, presence: true
    validates :image, presence: true
    
    
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
