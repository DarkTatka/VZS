# -*- encoding : utf-8 -*-
class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.string :name
      t.references :user
      t.integer :group

      t.timestamps
    end
    add_index :galleries, :user_id
  end
end
