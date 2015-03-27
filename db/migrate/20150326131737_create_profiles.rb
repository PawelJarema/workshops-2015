class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :age
      t.text :address
      t.text :bio
      t.references :user, index: true

      t.timestamps
    end
  end
end
