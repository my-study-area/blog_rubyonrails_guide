FactoryBot.define do
  factory :article do
    title {FFaker::CheesyLingo.title}
    text {FFaker::CheesyLingo.sentence}
  end
end
