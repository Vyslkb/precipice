class RemoveSizeFromPrintOptions < ActiveRecord::Migration
  def change
    change_table(:print_options) do |t|
      t.remove :size
    end
  end
end
