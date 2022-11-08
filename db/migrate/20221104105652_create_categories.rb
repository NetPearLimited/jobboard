class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string   "name",        limit: 255
      t.text     "description", limit: 65535
      t.references  "parent_id",   limit: 4
      t.boolean  "important",                 default: false
      t.integer  "position",    limit: 4,     default: 0
      t.timestamps
    end
  end
end



 