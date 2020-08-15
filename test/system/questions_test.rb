require "application_system_test_case"

class QuestionsTest < ApplicationSystemTestCase
  setup do
    @question = questions(:one)
  end

  test "visiting the index" do
    visit questions_url
    assert_selector "h1", text: "Questions"
  end

  test "creating a Question" do
    visit questions_url
    click_on "New Question"

    fill_in "Answer a", with: @question.answer_a
    fill_in "Answer b", with: @question.answer_b
    fill_in "Answer c", with: @question.answer_c
    fill_in "Answer d", with: @question.answer_d
    fill_in "Correct answer", with: @question.correct_answer
    fill_in "Correct answers received", with: @question.correct_answers_received
    fill_in "Dislike count", with: @question.dislike_count
    fill_in "Incorrect answers received", with: @question.incorrect_answers_received
    fill_in "Like count", with: @question.like_count
    fill_in "Question text", with: @question.question_text
    fill_in "Tags", with: @question.tags
    click_on "Create Question"

    assert_text "Question was successfully created"
    click_on "Back"
  end

  test "updating a Question" do
    visit questions_url
    click_on "Edit", match: :first

    fill_in "Answer a", with: @question.answer_a
    fill_in "Answer b", with: @question.answer_b
    fill_in "Answer c", with: @question.answer_c
    fill_in "Answer d", with: @question.answer_d
    fill_in "Correct answer", with: @question.correct_answer
    fill_in "Correct answers received", with: @question.correct_answers_received
    fill_in "Dislike count", with: @question.dislike_count
    fill_in "Incorrect answers received", with: @question.incorrect_answers_received
    fill_in "Like count", with: @question.like_count
    fill_in "Question text", with: @question.question_text
    fill_in "Tags", with: @question.tags
    click_on "Update Question"

    assert_text "Question was successfully updated"
    click_on "Back"
  end

  test "destroying a Question" do
    visit questions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Question was successfully destroyed"
  end
end
