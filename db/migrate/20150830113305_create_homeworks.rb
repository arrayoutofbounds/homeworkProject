class CreateHomeworks < ActiveRecord::Migration
  def change
    create_table :homeworks do |t|
      t.string :title
      t.text :question
      t.datetime :duedate

      t.timestamps null: false
    end
  end
end
