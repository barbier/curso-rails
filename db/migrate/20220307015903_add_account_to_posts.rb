class AddAccountToPosts < ActiveRecord::Migration[6.1]
  def change
    add_reference :posts, :account
  end
end
