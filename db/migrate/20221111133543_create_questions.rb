# frozen_string_literal: true

class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.references :author, foreign_key: { to_table: :users, on_delete: :nullify }
      t.timestamps
    end
  end
end
