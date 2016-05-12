class AddConfigsToUsers < ActiveRecord::Migration[5.0]
  def change
    enable_extension 'hstore'
    add_column :users, :configs, :hstore
  end
end
