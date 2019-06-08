class CreateUsersCarsAndReviews < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :name
      t.string :password_digest
  end

  def change
  create_table :cars do |t|
    t.string :name
    t.string :model
  end

  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :user_id
      t.integer :car_id
  end

end
