class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :querystring
      t.string :city
      t.string :state
      t.string :country
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end
end
