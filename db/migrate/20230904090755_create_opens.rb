class CreateOpens < ActiveRecord::Migration[7.0]
  def change
    create_table :opens do |t|
      t.integer :source
      t.text :request_ip

      t.timestamps
    end
  end
end
