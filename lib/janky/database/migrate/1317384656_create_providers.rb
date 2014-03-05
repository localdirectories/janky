class CreateProviders < ActiveRecord::Migration
  def self.up
    create_table :providers, :force => true do |t|
      t.string :name,        :null => false
      t.string :base_url,    :null => false
      t.string :module_name, :null => false
      t.string :hubot_prefix
      t.timestamps
    end
    add_index :providers, :name,         :unique => true
    add_index :providers, :base_url,     :unique => true
    add_index :providers, :hubot_prefix, :unique => true

    add_column :repositories, :provider_id, :integer, :null => true
    add_index  :repositories, :provider_id
  end

  def self.down
    drop_table :providers

    remove_index  :repositories, :provider_id
    remove_column :repositories, :provider_id
  end
end
