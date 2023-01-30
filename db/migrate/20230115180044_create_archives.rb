class CreateArchives < ActiveRecord::Migration[6.0]
  def change
    create_table :archives do |t|
      t.boolean :archive

      t.timestamps
    end
  end
end
