Dado("que eu acesso a página inicial") do
  visit('http://localhost:3000/')
end

Entao("eu acesso o conteúdo da página") do
  expect(page).to have_current_path( 'http://localhost:3000/', url: true)
  title = find('h1')
  expect(title.text).to include("Hello World!")
end
