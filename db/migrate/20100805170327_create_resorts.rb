class CreateResorts < ActiveRecord::Migration

  def self.up
    create_table :resorts do |t|
      t.string :title
      t.integer :currency_id
      t.integer :tour_type_id
      t.integer :country_id
      t.integer :weathher_id
      t.text :description
      t.integer :position

      t.timestamps
    end

    add_index :resorts, :id

    load(Rails.root.join('db', 'seeds', 'resorts.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "Resorts"})

    Page.find_all_by_link_url("/resorts").each do |page|
      page.link_url, page.menu_match = nil
      page.deletable = true
      page.destroy
    end
    Page.destroy_all({:link_url => "/resorts"})

    drop_table :resorts
  end

end
