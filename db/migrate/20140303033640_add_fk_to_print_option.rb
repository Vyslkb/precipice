class AddFkToPrintOption < ActiveRecord::Migration
  def change
    add_column :print_options, :print_type_id, :integer
  end
end
