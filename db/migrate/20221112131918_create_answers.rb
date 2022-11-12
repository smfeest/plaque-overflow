# frozen_string_literal: true

class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.references :question, null: false, foreign_key: true
      t.string :body, null: false
      t.references :author, foreign_key: { to_table: :users, on_delete: :nullify }
      t.timestamps
    end
  end
end
