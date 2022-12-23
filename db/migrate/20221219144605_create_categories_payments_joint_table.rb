class CreateCategoriesPaymentsJointTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :categories, :payments do |t|
      t.index :category_id
      t.index :payment_id

      t.timestamps
    end
  end
end
