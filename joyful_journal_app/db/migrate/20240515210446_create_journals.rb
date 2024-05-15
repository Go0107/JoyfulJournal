class CreateJournals < ActiveRecord::Migration[7.0]
  def change
    create_table :journals do |t|
      t.text :content
      t.string :stamp

      t.timestamps
    end
  end
end
