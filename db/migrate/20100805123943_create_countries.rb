class CreateCountries < ActiveRecord::Migration

  def self.up
    create_table :countries do |t|
      t.string :title
      t.text :description
      t.string :extension
      t.integer :position

      t.timestamps
    end

    add_index :countries, :id

    load(Rails.root.join('db', 'seeds', 'countries.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "Countries"})

    Page.find_all_by_link_url("/countries").each do |page|
      page.link_url, page.menu_match = nil
      page.deletable = true
      page.destroy
    end
    Page.destroy_all({:link_url => "/countries"})

    drop_table :countries
  end

end
