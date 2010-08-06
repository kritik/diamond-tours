class CreateCurrencies < ActiveRecord::Migration

  def self.up
    create_table :currencies do |t|
      t.string :currency
      t.decimal :exchange, :precision => 6, :scale => 4
      t.integer :position

      t.timestamps
    end

    add_index :currencies, :id

    load(Rails.root.join('db', 'seeds', 'currencies.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "Currencies"})

    Page.find_all_by_link_url("/currencies").each do |page|
      page.link_url, page.menu_match = nil
      page.deletable = true
      page.destroy
    end
    Page.destroy_all({:link_url => "/currencies"})

    drop_table :currencies
  end

end
