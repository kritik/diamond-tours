class CreateSections < ActiveRecord::Migration

  def self.up
    create_table :sections do |t|
      t.string :title
      t.integer :resort_id
      t.integer :position

      t.timestamps
    end

    add_index :sections, :id

    load(Rails.root.join('db', 'seeds', 'sections.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "Sections"})

    Page.find_all_by_link_url("/sections").each do |page|
      page.link_url, page.menu_match = nil
      page.deletable = true
      page.destroy
    end
    Page.destroy_all({:link_url => "/sections"})

    drop_table :sections
  end

end
