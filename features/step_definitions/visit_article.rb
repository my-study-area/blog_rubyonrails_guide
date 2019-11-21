Quando("eu clico no link {string}") do |link_text|
  find_link(link_text).click
end

Entao("eu acesso a página de Artigos") do
  expect(page).to have_current_path('http://localhost:3000/articles')
  title = find('h1')
  expect(title.text).to include('Listing Articles')
end
