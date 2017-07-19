class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :content
      t.references :from_user
      t.references :to_user

      t.timestamps
    end
  end
end
