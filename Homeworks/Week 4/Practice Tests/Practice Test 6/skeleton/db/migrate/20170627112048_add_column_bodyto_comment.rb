
class AddColumnBodytoComment < ActiveRecord::Migration
  def change
    add_column :comments, :body, :string
  end
end
