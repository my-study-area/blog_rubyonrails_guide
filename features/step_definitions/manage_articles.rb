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

Given("I have a article") do
  @title = FFaker::CheesyLingo.title
  expect{create(:article, title: @title)}.to change {Article.count}.by 1
end

When("I change de title of the article") do
  visit articles_path
  click_link "Edit"
  expect(page).to have_content("Edit Article")
  @title_updated = FFaker::CheesyLingo.title
  fill_in "article_title", :with => @title_updated
  click_button "Update Article"
end

Then("I should see the article with the new title") do
  visit articles_path
  expect(page).to have_content @title_updated
end

When("I change de text of the article") do
  visit articles_path
  click_link "Edit"
  expect(page).to have_content("Edit Article")
  @text_updated = FFaker::CheesyLingo.sentence
  fill_in "article_text", :with => @text_updated
  click_button "Update Article"
end

Then("I should see the article with the new text") do
  visit articles_path
  expect(page).to have_content @text_updated
end

When("I remove a article") do
  visit articles_path
  click_link "Destroy"
  page.driver.browser.switch_to.alert.accept
end

Then("I should not see it listining anymore") do
  visit articles_path
  expect(page).to_not have_content @title
end
