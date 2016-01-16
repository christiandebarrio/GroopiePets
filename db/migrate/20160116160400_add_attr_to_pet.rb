class AddAttrToPet < ActiveRecord::Migration
  def change
    add_column :pets, :name, :string
    add_column :pets, :species, :string
    add_column :pets, :age, :integer
  end
end
