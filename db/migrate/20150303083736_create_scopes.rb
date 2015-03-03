class CreateScopes < ActiveRecord::Migration
  def change
    create_table :scopes do |t|
      t.integer :hoc_ky
      t.string :ma_hp
      t.string :ten_hp
      t.integer :tc
      t.integer :lop_hoc
      t.float :diem_qt
      t.float :diem_thi
      t.string :diem_chu

      t.timestamps
    end
  end
end
