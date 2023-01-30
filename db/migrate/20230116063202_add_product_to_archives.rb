class AddProductToArchives < ActiveRecord::Migration[6.0]
  def change
    add_reference :archives, :product, null: false, foreign_key: true
  end
end
