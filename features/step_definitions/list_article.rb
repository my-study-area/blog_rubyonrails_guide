Dado("Eu possuo {int} artigos cadastrados") do |counter|
  counter_local = counter
  while counter > 0 do
    # Article.create(title: "article #{counter}", text: "text article #{counter}")
    FactoryBot.create(:article)
    counter = counter - 1
  end
  expect(counter_local).to eq Article.count
end

Quando("eu acesso a pagina de artigos") do
  visit articles_path
  title = find('h1')
  expect(title.text).to include('Listing Articles')
end

Entao("eu visualizo os {int} artigos") do |counter|
  byebug
  page.assert_selector( 'tbody>tr', count: counter)
end
