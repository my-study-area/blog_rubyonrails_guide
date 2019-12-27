Dado("que eu acesso a página inicial") do
  visit root_path
end

Entao("eu acesso o conteúdo da página") do
  title = find('h1')
  expect(title.text).to include("Hello World!")
end
