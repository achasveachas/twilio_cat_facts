class CreateSubscribers < ActiveRecord::Migration[5.1]
  def change
    create_table :subscribers do |t|
      t.string :phone_number

      t.timestamps
    end
  end
end
