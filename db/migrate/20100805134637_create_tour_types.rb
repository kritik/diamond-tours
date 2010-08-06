class CreateTourTypes < ActiveRecord::Migration

  def self.up
    create_table :tour_types do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end

    add_index :tour_types, :id

    load(Rails.root.join('db', 'seeds', 'tour_types.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "Tour Types"})

    Page.find_all_by_link_url("/tour_types").each do |page|
      page.link_url, page.menu_match = nil
      page.deletable = true
      page.destroy
    end
    Page.destroy_all({:link_url => "/tour_types"})

    drop_table :tour_types
  end

end
