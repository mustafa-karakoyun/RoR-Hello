# db/seeds.rb

puts "Tüm eski veriler temizleniyor..."
Like.destroy_all
Comment.destroy_all
Post.destroy_all
Category.destroy_all
User.destroy_all

puts "Kategoriler oluşturuluyor..."
kategori_teknoloji = Category.create!(name: "Teknoloji")
kategori_spor = Category.create!(name: "Spor")
kategori_gundem = Category.create!(name: "Gündem")

puts "Kullanıcılar oluşturuluyor..."
user1 = User.create!(
  name: "Mustafa Yılmaz",
  email: "mustafa@ornek.com"
)
user2 = User.create!(
  name: "Ayşe Demir",
  email: "ayse@ornek.com"
)

puts "Gönderiler (Post'lar) oluşturuluyor..."
post1 = Post.create!(
  user: user1,
  category: kategori_teknoloji,
  title: "Rails 8.1'deki Yenilikler",
  content: "Rails'in yeni sürümü harika özelliklerle geldi..."
)

post2 = Post.create!(
  user: user2,
  category: kategori_spor,
  title: "Süper Lig'de Bu Hafta",
  content: "Bu hafta oynanan maçlarda ilginç sonuçlar alındı."
)

post3 = Post.create!(
  user: user1,
  category: kategori_gundem,
  title: "WSL2 ve Windows Geliştirme Deneyimi",
  content: "Windows üzerinde Linux çalıştırmak artık çok kolay."
)

puts "Yorumlar oluşturuluyor..."
Comment.create!(
  post: post1,
  user: user2,
  body: "Harika bir yazı, özellikle Active Record yeniliklerini beğendim."
)
Comment.create!(
  post: post2,
  user: user1,
  body: "Maç özetlerini nerede bulabilirim?"
)
Comment.create!(
  post: post3,
  user: user2,
  body: "Katılıyorum, Windows'ta Ruby kurarken yaşadığım sorunlar WSL ile çözüldü."
)

puts "Beğeniler (Like'lar) oluşturuluyor..."
Like.create!(user: user1, post: post2)
Like.create!(user: user2, post: post1)
Like.create!(user: user2, post: post3)

puts "Tohumlama (Seeding) tamamlandı!"