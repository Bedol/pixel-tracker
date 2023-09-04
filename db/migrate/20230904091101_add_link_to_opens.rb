class AddLinkToOpens < ActiveRecord::Migration[7.0]
  def change
    add_reference :opens, :link, null: false, foreign_key: true
  end
end
