class CreateAnastheticTypes < ActiveRecord::Migration
  def change
    create_table :anasthetic_types do |t|
      t.string :type

      t.timestamps
    end
  end
end
