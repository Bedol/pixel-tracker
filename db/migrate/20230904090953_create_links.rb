class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.text :owner_code
      t.text :code

      t.timestamps
    end
  end
end
