Quando("eu clico no link {string}") do |link_text|
  find_link(link_text).click
end

Entao("eu acesso a página de Artigos") do
  title = find('h1')
  expect(title.text).to include('Listing Articles')
end
