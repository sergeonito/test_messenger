class Init < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|

      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest

      t.timestamps
    end

    create_table :conversations do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.timestamps
    end

    create_table :messages do |t|
      t.text :body
      t.references :conversation, index: true
      t.references :user,         index:   true
      t.boolean :read,            default: false
      t.timestamps
    end
  end
end
