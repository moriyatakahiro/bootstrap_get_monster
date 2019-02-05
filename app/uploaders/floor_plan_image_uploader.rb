class FloorPlanImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  require 'mini_magick'
  
  storage :file
  
  process resize_to_limit:  [400, 320]
  
  def extension_white_list
   %w(jpg jpeg gif png)
  end

 # 拡張子が同じでないとGIFをJPGとかにコンバートできないので、ファイル名を変更
 def filename
   super.chomp(File.extname(super)) + '.jpg' if original_filename.present?
 end
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

 
end
