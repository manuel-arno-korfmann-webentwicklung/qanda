class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.text :question_text
      t.string :answer_a
      t.string :answer_b
      t.string :answer_c
      t.string :answer_d
      t.integer :like_count
      t.integer :dislike_count
      t.string :correct_answer
      t.integer :correct_answers_received
      t.integer :incorrect_answers_received
      t.text :tags

      t.timestamps
    end
  end
end
