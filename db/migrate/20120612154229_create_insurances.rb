class CreateInsurances < ActiveRecord::Migration
  def change
    create_table :insurances do |t|
      t.references :plan
      t.string :carrier_name
      t.string :plan_name
      t.string :policy_number
      t.date :start_date
      t.date :renewal_date
      t.float :annual_premium
      t.text :comment

      t.timestamps
    end
    add_index :insurances, :plan_id
  end
end
