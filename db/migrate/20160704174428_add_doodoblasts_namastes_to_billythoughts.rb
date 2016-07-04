class AddDoodoblastsNamastesToBillythoughts < ActiveRecord::Migration
  def change
    add_column :billythoughts, :doodooblasts, :int, default: 0
    add_column :billythoughts, :namastes, :int, default: 0
  end
end
