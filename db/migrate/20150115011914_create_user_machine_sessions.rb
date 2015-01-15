class CreateUserMachineSessions < ActiveRecord::Migration
  def change
    create_table :user_machine_sessions do |t|
      t.references :user, index: true
      t.references :machine, index: true
      t.datetime :started_at
      t.datetime :completed_at

      t.timestamps null: false
    end
    add_foreign_key :user_machine_sessions, :users
    add_foreign_key :user_machine_sessions, :machines
  end
end
