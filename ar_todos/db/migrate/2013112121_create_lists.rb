class CreateLists < ActiveRecord::Migration
	def change
    create_table :tasks do |t|
      t.string :description
      t.string :completeness, default: "-"
      t.timestamps
    end
  end
end