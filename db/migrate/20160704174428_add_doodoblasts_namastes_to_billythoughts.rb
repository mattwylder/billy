class AddDoodoblastsNamastesToBillythoughts < ActiveRecord::Migration
  def change
    add_column :billythoughts, :doodooblasts, :int
    add_column :billythoughts, :namastes, :int
  end
end
