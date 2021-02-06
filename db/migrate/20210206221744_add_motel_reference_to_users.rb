class AddMotelReferenceToUsers < ActiveRecord::Migration[6.0]
  def change
    add_reference :users, :motel, foreign_key: true
  end
end
