class CreateVacancies < ActiveRecord::Migration[6.1]
  def change
    create_table :vacancies do |t|
      t.string :title
      t.string :location
      t.text :description
      t.string :requirements
      t.string :salary
      t.boolean :available
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
