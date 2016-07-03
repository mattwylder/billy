class CreateBillythoughts < ActiveRecord::Migration
  def change
    create_table :billythoughts do |t|
      t.text :content
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :billythoughts, [:user_id, :created_at]
  end
end
