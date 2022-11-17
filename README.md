# Dio_Clint

### Dependency Installation
* [dio: ^4.0.6](https://pub.dev/packages/dio)
* [get_it 7.2.0](https://pub.dev/packages/get_it)
* [intl 0.17.0](https://pub.dev/packages/intl)

### Folder Structure
* **Data :** 
	 * Models, 
     * Network, 
     * Repositories
* **DI :** 
    * For dependency injection
* **UI :** 
    * Contains screens, widgets

### ReqRes API
* [reqres.in](https://reqres.in/)

### DioClient
* Sunucuya istek göndermek için önce bir **Client** oluşturmalıyız.
* Burada **Base Url, Connection Timeout, Receive Timeout** ve diğer seçenekleri ayarlayabiliriz.
* *lib > data > network > dio_client.dart* 
* *lib > data > network > api > constant > endpoints.dart*

### Creating (GET, POST, PUT, DELETE) Methods
* DioClient sınıfı içinde bir **GET, POST, PUT, DELETE** yöntemlerini oluşturalım. 
* *lib > data > network > dio_client.dart*

### Model Creation
* Sunucudan elde ettiğimiz verileri Dart tarafından okunabilir bir biçimde ayrıştırmak için bir model geliştirmemiz gerekiyor.
* Bizim durumumuzda iki model yapacağız. Biri Users listesi içindir, diğeri ise POST method örneğinde oluşturacağımız yeni user içindir.
* Dart Modeli oluşturmak için [Dart Model Generator](https://javiercbk.github.io/json_to_dart/)

### API Request Class
* Artık hepimiz bir API isteği yapmaya hazırız.
* *lib > data > network > api*'ye gidip bir user klasörü oluşturalım ve bunun içinde bir user_api.dart dosyası oluşturalım.
* Burada, doğrudan müşterinin yöntemini çağıracak ve RAW verilerini döndürecek farklı API istek yöntemleri tanımlayacağız.
* Base URL'yi DioClient'te zaten tanımladığımız için, tam URL'yi değil, yalnızca bitiş Noktasının geri kalanını geçirmemiz gerekir.
* PUT(Update) ve Delete yöntemi için, yalnızca o kimliği içeren kullanıcıyı güncellemek için kullanıcının id e ihtiyacımız var.

### Repository
* *lib > data > network > api > user_api.dart*
* **UserApi** sınıfı yalnızca RAW (*işlenmemiş veri*) verilerini döndürür.
* Evet, bu RAW verileri repository class içinde **UserModel/NewUser** modeline dönüştürülür.
* Bu mantığı ayırmamızın nedeni daha iyi kod okunabilirliği ve test amaçlıdır.
* Ayrılmanın bir başka önemli nedeni de bu sınıfta sunucuya ilettiğiniz verileri ve ayrıca sunucunun size verdiği verileri değiştirebilmenizdir. Bu sınıfta doğrulamalar yapabilir, hataları işleyebilir, vb.
* *lib > data > repository > user_repository.dart*

### Error Handling
* DioError'u yakalamak için DioException sınıfını kullanalım
* Temel olarak, anlaşılabilen hata mesajını döndüren ayrı bir sınıf oluşturalım.
* Hatalar; Bağlantı zaman aşımı mesajı, iptal isteği hatası veya sunucu tarafından da gönderilen hata olabilir.
* *lib > data > network > dio_exception.dart*
* relavent message ; *final errorMessage = DioExceptions.fromDioError(e).toString();*

### Injecting Dependency => GetIt
* Singleton sınıflarını enjekte etmek için [GetIt](https://pub.dev/packages/get_it) paketini kullanıyoruz.
* *lib > di > service_locator.dart*
*  **Injecting Dependency** Bir sınıfın bağımlılıkları oluşturmak yerine dış kaynaklardan bağımlılık talep ettiği bir tasarım modelidir.
* Bu, bağımlı nesnelerin sınıfınıza enjekte edildiği veya sağlandığı anlamına gelir.
* Sınıfın kendi başına herhangi bir başlatma yapması gerekmez. Enjektörden istediğini alacak.
* Hizmet Bulucu kavramına aşina değilseniz, arabirimi (soyut temel sınıf) somut bir uygulamadan ayırmanın bir yoludur ve aynı zamanda somut uygulamaya arabirim üzerinden Uygulamanızın her yerinden erişmenize olanak tanır.
* **get_it paketi,** bağımlılık enjeksiyonunu bizim için çok kolaylaştırıyor.








