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

Given("I have an article") do
  @title = FFaker::CheesyLingo.title
  expect{create(:article, title: @title)}.to change {Article.count}.by 1
end

Given("I visit this article page") do
  @article = create(:article)
  visit article_path(@article)
  expect(page).to have_content "Comments"
end

When("I submit a new comment") do
  @commenter = FFaker::NameBR.name
  @body = FFaker::CheesyLingo.sentence
  fill_in "comment_commenter", with: @commenter
  fill_in "comment_body", with: @body
  click_button "Create Comment"
end

Then("I should see the comment in this article") do
  expect(page).to have_content @commenter
  expect(page).to have_content @body
end
