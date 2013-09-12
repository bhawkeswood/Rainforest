class AddUrlToProducts < ActiveRecord::Migration
  def change
  	change_table :products do |p|
  		p.string :url
  	end
  end
end
