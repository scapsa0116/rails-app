class RemoveColumnFromPictures < ActiveRecord::Migration[6.0]
  def change
    remove_column :pictures, :image_url
  end
end
