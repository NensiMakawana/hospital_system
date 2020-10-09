class AddFieldsToPatients < ActiveRecord::Migration[6.0]
  def change
    add_column :patients, :name, :string
    add_column :patients, :number, :string
    add_column :patients, :age, :float
    add_column :patients, :gender, :string
    add_column :patients, :sickness, :string
  end
end
