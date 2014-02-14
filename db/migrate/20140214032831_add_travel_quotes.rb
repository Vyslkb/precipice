class AddTravelQuotes < ActiveRecord::Migration
  def change
    add_column :additional_contents, :travel_quote, :text
  end
end
