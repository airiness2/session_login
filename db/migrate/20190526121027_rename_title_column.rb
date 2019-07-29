class RenameTitleColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :blogs, :name, :user_id
  end
end
