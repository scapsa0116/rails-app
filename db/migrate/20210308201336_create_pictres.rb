class CreatePictres < ActiveRecord::Migration[6.0]
  def change
    create_table :pictres do |t|
      t.string :image_url
      t.string :description

      t.timestamps
    end
  end
end
