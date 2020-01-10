Given("I have {int} comments in an article") do |count|
  @article = create(:article)
  @comments = create_list(:comment, count, article_id: @article.id )
  expect(@article.comments.count).to eq count
end

When("I visit comments page from this article") do
  visit article_path(@article)
  expect(page).to have_content "Comments"
end

Then("I should see the list of comments this article") do
  expect(page).to have_content @comments.first.commenter
  expect(page).to have_content @comments.first.body
  expect(page).to have_content @comments.second.commenter
  expect(page).to have_content @comments.second.body
  expect(page).to have_content @comments.last.commenter
  expect(page).to have_content @comments.last.body
end
