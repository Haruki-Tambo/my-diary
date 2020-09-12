class AddTitleToDiaries < ActiveRecord::Migration[5.2]
  def change
    add_column :diaries, :title, :string
  end
end
