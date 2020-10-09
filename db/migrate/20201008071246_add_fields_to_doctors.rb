class AddFieldsToDoctors < ActiveRecord::Migration[6.0]
  def change
    add_column :doctors, :name, :string
    add_column :doctors, :number, :string
    add_column :doctors, :specialization, :string
    add_column :doctors, :gender, :string
  end
end
