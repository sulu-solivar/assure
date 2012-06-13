class AddUserIdToInsurance < ActiveRecord::Migration
  def change
    add_column :insurances, :user_id, :integer

  end
end
