class CreateContacts < ActiveRecord::Migration[8.0]
  def change
    create_table :contacts, id: :uuid do |t|
      t.string :slug
      t.string :label
      t.string :value
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
