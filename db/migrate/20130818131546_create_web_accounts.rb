class CreateWebAccounts < ActiveRecord::Migration
  def change
    create_table :web_accounts do |t|
      t.string :name
      t.string :url
      t.string :login
      t.string :password
      t.string :description

      t.timestamps
    end
  end
end
