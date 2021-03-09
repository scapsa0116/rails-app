class DropPictres < ActiveRecord::Migration[6.0]
  def change
    drop_table :pictres
  end
end
