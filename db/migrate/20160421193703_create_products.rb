class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.string :status
      t.text :supportedFeatures

      t.timestamps null: false
    end
  end
end
