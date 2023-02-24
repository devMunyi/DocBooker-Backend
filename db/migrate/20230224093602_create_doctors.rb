class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :email
      t.text :specialization
      t.string :picture

      t.timestamps
    end
  end
end
