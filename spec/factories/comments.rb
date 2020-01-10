FactoryBot.define do
  factory :comment do
    commenter {FFaker::NameBR.name}
    body {FFaker::CheesyLingo.sentence}
    article
  end
end
