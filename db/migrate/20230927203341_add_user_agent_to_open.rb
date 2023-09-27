class AddUserAgentToOpen < ActiveRecord::Migration[7.0]
  def change
    add_column :opens, :user_agent, :string, limit: 255
  end
end
