# Ruby on Rails API Projesi: hello_app

Bu proje, Ruby on Rails 8.1 kullanılarak geliştirilmiş, API-only (sadece API) bir uygulamadır. Proje, 5 farklı model arasındaki ilişkileri (has_many, belongs_to) göstermeyi ve bu modeller için tam JSON tabanlı CRUD (Oluşturma, Okuma, Güncelleme, Silme) işlemlerini sunan API endpoint'leri sağlamayı amaçlamaktadır.

Veritabanı olarak SQLite3 kullanılmıştır ve örnek veriler Türkçe olarak `db/seeds.rb` dosyasında yapılandırılmıştır.

## ÖNEMLİ ÇALIŞTIRMA NOTU

Bu proje, Windows ortamlarındaki `sqlite3` gem'inin derleme (DLL) sorunları nedeniyle **doğrudan Windows (PowerShell/CMD) üzerinde çalıştırılamaz.**

Proje, **WSL2 (Windows Subsystem for Linux)**, **GitHub Codespaces** veya **native Linux (Ubuntu, vb.)** gibi Unix tabanlı bir ortamda geliştirilmiş ve test edilmiştir.

Projeyi sorunsuz çalıştırmak için lütfen aşağıdaki "Projeyi Çalıştırma" bölümündeki Linux/WSL adımlarını takip edin.

## Modeller ve İlişkiler

Proje, 5 adet model üzerine kurulmuştur:

1.  **`User` (Kullanıcı)**
    * `has_many :posts`
    * `has_many :comments`
    * `has_many :likes`

2.  **`Category` (Kategori)**
    * `has_many :posts`

3.  **`Post` (Gönderi)**
    * `belongs_to :user` (Yazarı)
    * `belongs_to :category` (Kategorisi)
    * `has_many :comments`
    * `has_many :likes`

4.  **`Comment` (Yorum)**
    * `belongs_to :user` (Yorumu yapan)
    * `belongs_to :post` (Yorum yapılan gönderi)

5.  **`Like` (Beğeni)**
    * `belongs_to :user` (Beğenen kullanıcı)
    * `belongs_to :post` (Beğenilen gönderi)

## Projeyi Çalıştırma (Linux / WSL)

1.  **Projeyi Klonla:**
    ```bash
    git clone [https://github.com/mustafa-karakoyun/RoR-Hello.git](https://github.com/mustafa-karakoyun/RoR-Hello.git)
    cd RoR-Hello
    ```

2.  **Gerekli Kütüphaneleri Kur (Ubuntu/Debian):**
    Projeyi çalıştırmak için Ruby, Bundler ve SQLite3 geliştirme kütüphanelerinin kurulu olması gerekir.
    ```bash
    sudo apt-get update
    sudo apt-get install ruby-full build-essential libsqlite3-dev
    sudo gem install bundler
    ```

3.  **Gem'leri Kur:**
    İzin sorunlarını önlemek ve gem'leri proje klasörüne kurmak için `--path` parametresini kullanıyoruz:
    ```bash
    bundle install --path vendor/bundle
    ```

4.  **Veritabanını Sıfırla (Reset):**
    Bu tek komut, veritabanını oluşturur (`create`), tabloları kurar (`migrate`) ve Türkçe örnek verileri (`seed`) yükler:
    ```bash
    bundle exec rails db:reset
    ```

5.  **Sunucuyu Başlat:**
    ```bash
    bundle exec rails s
    ```
    Sunucu artık `http://127.0.0.1:3000` adresinde çalışıyor olacaktır.

## API Endpoints ve Örnekleri

Proje, `config/routes.rb` dosyasında `api/v1` isim alanı (namespace) altında yapılandırılmıştır.

*(Not: Bu README, `Category` ve `Like` için de controller'ların oluşturulduğunu varsayar. Henüz oluşturulmadıysa, `Users`, `Posts` ve `Comments` için olanlar çalışacaktır.)*

### `GET /api/v1/users`
Tüm kullanıcıları, ilişkili gönderileri ve yorumları ile birlikte listeler.

### `GET /api/v1/posts`
Tüm gönderileri, yazarları, kategorileri, yorumları ve beğenileri ile birlikte listeler.

**Örnek `curl` İsteği:**
```bash
curl [http://127.0.0.1:3000/api/v1/posts](http://127.0.0.1:3000/api/v1/posts)
