class CreateCreatePrivateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :create_private_messages do |t|
      t.text :content
      t.references :recipient, index: true
      t.references :sender, index: true  
      t.timestamps
    end
  end
end
