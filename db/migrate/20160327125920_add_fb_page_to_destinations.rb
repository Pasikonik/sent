class AddFbPageToDestinations < ActiveRecord::Migration[5.0]
  def change
    add_column :destinations, :fb_page, :string
  end
end
