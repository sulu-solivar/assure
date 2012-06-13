class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.string :plan

      t.timestamps
    end
  end
end
