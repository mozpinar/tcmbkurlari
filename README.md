# tcmbkurlari
TCMB'den döviz kurlarını okumak için küçük bir program. <br><br>

Bu küçük program size TCMB'den kurları nasıl alacağınızın bir yolunu göstermektedir.<br>
TCMB kurları <b>https://www.tcmb.gov.tr/kurlar/today.xml</b> adresinde tutmaktadır, eski tarihli kurları ise <b>https://www.tcmb.gov.tr/kurlar/202312/05122023.xml</b> gibi almak gerekiyor.<br> 
Bunun formatı .../kurlar/YYYYMM/DDMMYYYY.xml şeklinde olmalı. 
İndirilen XML'i kendiniz de çözümleyip bilgileri alabilirsiniz. Sonuçta bildiğimiz XML! Ancak çok daha kolay çözümleyebilmek için ben WSDL indirip ATCMBXml.pas olarak kaydettim ve onu kullanıyorum. Siz de onu kullanabilirsiniz, ya da siz de <b>Import WSDL</b> ile onu indirebilirsiniz.<br>
Programda JVCL kütüphanesindeki TJvMemoryData bileşeni kullanılmaktadır. Bu nedenle Delphi'nize uygun JVCL kütüphanesini yüklemeniz gerekiyor. Delphiciyseniz zaten gerekli bir kütüphane. <br>
Program IdHttp bileşenini kullanmaktadır ve TCMB ssl bağlantı istediği için OpenSSL kullandım. Bu nedenle OpenSSL'i indirip (https://indy.fulgan.com/SSL/    openssl-1.0.2q-i386-win32.zip) içinden libeay32.dll ve ssleay32.dll dosyalarını sizin Exe dosyasının yanına kopyalamanız gerekiyor. Eğer programınız 64 bitlikse bunun 64 bit olanı için aynı işlemi yapın.<br>
<br><br>
![Program ekran görüntüsü](https://raw.githubusercontent.com/mozpinar/tcmbkurlari/master/kurlar1.png)
