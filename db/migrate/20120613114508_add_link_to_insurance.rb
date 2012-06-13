class AddLinkToInsurance < ActiveRecord::Migration
  def change
    add_column :insurances, :link, :text

  end
end
