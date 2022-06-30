class AddEmailToApplicant < ActiveRecord::Migration[6.1]
  def change
    add_column :applicants, :email, :string
  end
end
