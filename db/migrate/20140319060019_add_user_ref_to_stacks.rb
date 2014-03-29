class AddUserRefToStacks < ActiveRecord::Migration
  def change
    add_reference :stacks, :user, index: true
  end
end
