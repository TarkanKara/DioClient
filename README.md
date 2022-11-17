# dio_client

A new Flutter project.

## Dio_Clint

### Dependency Installation
* [dio: ^4.0.6](https://pub.dev/packages/dio)
* [get_it 7.2.0](https://pub.dev/packages/get_it)
* [intl 0.17.0](https://pub.dev/packages/intl)

### Folder Structure
* Data: Models, Network, Repositories
* DI : For dependency injection
* UI :  Contains screens, widgets

### ReqRes API
* [reqres.in](https://reqres.in/)

### DioClient
* Sunucuya istek göndermek için önce bir Client oluşturmalıyız.
* Burada Base Url, Connection Timeout, Receive Timeout ve diğer seçenekleri ayarlayabiliriz.
* lib > data > network > dio_client.dart 
* lib > data > network > api > constant > endpoints.dart

### Creating (GET, POST, PUT, DELETE) Methods
* DioClient sınıfı içinde bir GET, POST, PUT, DELETE yöntemlerini oluşturalım. lib > data > network > dio_client.dart

### Model Creation
* Sunucudan elde ettiğimiz verileri Dart tarafından okunabilir bir biçimde ayrıştırmak için bir model geliştirmemiz gerekiyor.
* Bizim durumumuzda iki model yapacağız. Biri Users listesi içindir, diğeri ise POST method örneğinde oluşturacağımız yeni user içindir.
* Dart Modeli oluşturmak için [Dart Model Generator](https://javiercbk.github.io/json_to_dart/)

### API Request Class
* Artık hepimiz bir API isteği yapmaya hazırız.
* lib > data > network > api'ye gidip bir user klasörü oluşturalım ve bunun içinde bir user_api.dart dosyası oluşturalım.
* Burada, doğrudan müşterinin yöntemini çağıracak ve RAW verilerini döndürecek farklı API istek yöntemleri tanımlayacağız.
* Temel URL'yi DioClient'te zaten tanımladığımız için, tam URL'yi değil, yalnızca Bitiş Noktasının geri kalanını geçirmemiz gerekir.
* PUT(Update) yöntemi için, yalnızca o kimliği içeren kullanıcıyı güncellemek için kullanıcının id e ihtiyacımız var.

### Repository
* Dediğimi hatırla, UserApi (lib > data > network > api > user_api.dart) sınıfı yalnızca RAW (işlenmemiş veri) verilerini döndürür.
* Evet, bu RAW verileri repository class içinde UserModel/NewUser modeline dönüştürülür.
* Bu mantığı ayırmamızın nedeni daha iyi kod okunabilirliği ve test amaçlıdır.
* Ayrılmanın bir başka önemli nedeni de bu sınıfta sunucuya ilettiğiniz verileri ve ayrıca sunucunun size verdiği verileri değiştirebilmenizdir. Bu sınıfta doğrulamalar yapabilir, hataları işleyebilir, vb.






