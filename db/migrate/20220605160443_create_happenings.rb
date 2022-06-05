class CreateHappenings < ActiveRecord::Migration[7.0]
  def change
    create_table :happenings do |t|
      t.string :title
      t.string :subtitle
      t.string :web_source
      t.string :category
      t.datetime :happening_at
      t.string :link

      t.timestamps
    end
  end
end
