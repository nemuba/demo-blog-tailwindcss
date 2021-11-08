class AddColumnsPgSearch < ActiveRecord::Migration[7.0]
  def change
    add_index :users, "to_tsvector('portuguese', name)", using: :gin
    add_index :tags, "to_tsvector('portuguese', name)", using: :gin
  end
end
