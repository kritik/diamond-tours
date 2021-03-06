class CreateStructureForNews < ActiveRecord::Migration

  def self.up
    create_table :news_items do |t|
      t.string :title
      t.text :body
      t.datetime :publish_date
      t.timestamps
    end

    add_index :news_items, :id

    User.find(:all).each do |user|
      user.plugins.create(:name => "News", :position => (user.plugins.maximum(:position) || -1) + 1)
    end

    page = Page.create(:title => "News",
                :link_url => "/news",
                :menu_match => "^/news.*$",
                :deletable => false,
                :position => Page.count)

    RefinerySetting.find_or_set(:default_page_parts, ["Body", "Side Body"]).each do |default_page_part|
      page.parts.create(:title => default_page_part, :body => nil)
    end

  end

  def self.down
    UserPlugin.destroy_all({:title => "News"})

    Page.find_all_by_link_url("/news").each do |page|
      page.link_url, page.menu_match = nil
      page.deletable = true
      page.destroy
    end
    Page.destroy_all({:link_url => "/news"})

    drop_table :news_items
  end

end