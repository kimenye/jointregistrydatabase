class RenameTypeFieldInAnastheticType < ActiveRecord::Migration
  def change
  	rename_column :anasthetic_types, :type, :anasthetic_type
  end
end
