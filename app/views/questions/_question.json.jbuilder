json.extract! question, :id, :question_text, :answer_a, :answer_b, :answer_c, :answer_d, :like_count, :dislike_count, :correct_answer, :correct_answers_received, :incorrect_answers_received, :tags, :created_at, :updated_at
json.url question_url(question, format: :json)
