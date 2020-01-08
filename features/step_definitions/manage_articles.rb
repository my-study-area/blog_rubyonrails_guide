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
