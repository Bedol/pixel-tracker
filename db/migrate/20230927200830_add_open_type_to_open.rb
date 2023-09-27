class AddOpenTypeToOpen < ActiveRecord::Migration[7.0]
  def change
    add_column :opens, :open_type, :integer, defautl: 0
  end
end
