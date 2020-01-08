Given("I have {int} articles") do |count|
  @articles = create_list(:article, count)
  expect(Article.count).to eq count
end

When("I visit articles page") do
  visit articles_path
  expect(page).to have_content "Listing Articles"
end

Then("I should see the list of articles") do
  expect(page).to have_content(@articles.first.title)
  expect(page).to have_content(@articles.second.title)
  expect(page).to have_content(@articles.last.title)
end

Given("I visit the new articles page") do
  visit new_article_path
  expect(page).to have_content "New Article"
end

When("I submit a new article") do
  @title = FFaker::CheesyLingo.title
  @text = FFaker::CheesyLingo.sentence
  fill_in "article_title", :with => @title
  fill_in "article_text", :with => @text
  click_button "Create Article"
end

Then("I should see the new book") do
  visit articles_path
  expect(page).to have_content @title
  expect(page).to have_content @text
end
