class CreateDeals < ActiveRecord::Migration[5.0]
  def change
    create_table :deals do |t|
      t.string :title
      t.text :description
      t.references :store, foreign_key: true

      t.timestamps
    end
  end
end
