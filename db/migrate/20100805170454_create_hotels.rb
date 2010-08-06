class CreateHotels < ActiveRecord::Migration

  def self.up
    create_table :hotels do |t|
      t.string :title
      t.integer :resort_id
      t.string :stars
      t.text :description
      t.integer :position

      t.timestamps
    end

    add_index :hotels, :id

    load(Rails.root.join('db', 'seeds', 'hotels.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "Hotels"})

    Page.find_all_by_link_url("/hotels").each do |page|
      page.link_url, page.menu_match = nil
      page.deletable = true
      page.destroy
    end
    Page.destroy_all({:link_url => "/hotels"})

    drop_table :hotels
  end

end
