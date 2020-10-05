class CreateEpisodes < ActiveRecord::Migration[6.0]
  def change
    create_table :episodes do |t|
      t.string :number
      t.references :character, null: false, foreign_key: true

      t.timestamps
    end
  end
end
