class RemoveScreenShotImageFromReports < ActiveRecord::Migration[5.1]
  def change
    remove_column :reports, :screen_shot_image
  end
end
