class AddUserIdToPictureTable < ActiveRecord::Migration[6.0]
  def change
    add_column :pictres, :user_id, :integer
  end
end
