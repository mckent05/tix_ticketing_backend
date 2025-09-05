# frozen_string_literal: true

class CreateTickets < ActiveRecord::Migration[7.1]
  def change
    create_table :tickets do |t|
      t.string :title, null: false
      t.string :image
      t.text :complaint, null: false
      t.integer :status, null: false, default: 0
      t.references :customer, null: false, foreign_key: { to_table: :users }
      t.references :agent, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
