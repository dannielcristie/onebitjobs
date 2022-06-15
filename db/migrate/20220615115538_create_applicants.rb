class CreateApplicants < ActiveRecord::Migration[6.1]
  def change
    create_table :applicants do |t|
      t.string :name
      t.references :vacany, null: false, foreign_key: true

      t.timestamps
    end
  end
end
