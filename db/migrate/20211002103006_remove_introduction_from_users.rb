class RemoveIntroductionFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :introduction, :integer
  end
end
