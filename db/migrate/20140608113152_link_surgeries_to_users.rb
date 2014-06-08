class LinkSurgeriesToUsers < ActiveRecord::Migration
  def change
  	add_reference :surgeries, :user, index: true
  end
end
