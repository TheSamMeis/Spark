class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :quantity
      t.datetime :completed_at
      t.datetime :striped_at

      t.timestamps
    end
  end
end
