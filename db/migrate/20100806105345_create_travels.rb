class CreateTravels < ActiveRecord::Migration

  def self.up
    create_table :travels do |t|
      t.integer :hotel_id
      t.integer :page_id
      t.date :date
      t.date :fdate
      t.string :ftype
      t.string :rtype
      t.string :city
      t.string :ttype
      t.integer :days
      t.integer :nights
      t.decimal :price
      t.integer :currency_id
      t.string :com
      t.integer :section_id
      t.date :pdate
      t.string :source
      t.integer :pocket_id
      t.integer :pocket_people
      t.boolean :active
      t.integer :avia
      t.integer :hotels
      t.integer :position

      t.timestamps
    end

    add_index :travels, :id

    load(Rails.root.join('db', 'seeds', 'travels.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "Travels"})

    Page.find_all_by_link_url("/travels").each do |page|
      page.link_url, page.menu_match = nil
      page.deletable = true
      page.destroy
    end
    Page.destroy_all({:link_url => "/travels"})

    drop_table :travels
  end

end
