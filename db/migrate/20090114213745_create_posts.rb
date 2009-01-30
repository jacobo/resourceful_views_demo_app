class CreatePosts < ActiveRecord::Migration
  def self.up
    
    common_columns_proc = Proc.new do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
    
    create_table :posts, &common_columns_proc
    create_table :blogpfosten, &common_columns_proc
    create_table :poteaux, &common_columns_proc
    create_table :alberini, &common_columns_proc
    create_table :bornes, &common_columns_proc
  end

  def self.down
    drop_table :posts
  end
end
