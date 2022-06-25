#burda images olusturuyoruz
./mvnw clean package
# bununla jar dosyalarinin son halini alamk icin tekrar clean package yapiyoruz. update ediyorum
docker build --force-rm -t "petclinic-admin-server:dev" ./spring-petclinic-admin-server
# docker build -t = image olusturur
# docker build --help = cli da yazinca asagidaki bilgiler geliyor.
# --force-rm = Dockerfile'da From ile base image seciliyor ve kendi image'imizi olusturuyoruz. sonra yeni container olusunca arada bizim olusturdugumuz image depoda kaliyor, force-rm ile o fazlaligi siliyoruz.
# container olusurken hata cikarsa containeri siliyor ama diger turlu silmiyor. 
# --force-rm = Always remove intermediate containers
# "petclinic-admin-server:dev" = image'e bir isim verdik.
# ./spring-petclinic-admin-server = kaynak olarak bu dosyayi kullan, burdaki Dockerfile'i kullan.
docker build --force-rm -t "petclinic-api-gateway:dev" ./spring-petclinic-api-gateway
docker build --force-rm -t "petclinic-config-server:dev" ./spring-petclinic-config-server
docker build --force-rm -t "petclinic-customers-service:dev" ./spring-petclinic-customers-service
docker build --force-rm -t "petclinic-discovery-server:dev" ./spring-petclinic-discovery-server
docker build --force-rm -t "petclinic-hystrix-dashboard:dev" ./spring-petclinic-hystrix-dashboard
docker build --force-rm -t "petclinic-vets-service:dev" ./spring-petclinic-vets-service
docker build --force-rm -t "petclinic-visits-service:dev" ./spring-petclinic-visits-service
docker build --force-rm -t "petclinic-grafana-server:dev" ./docker/grafana
docker build --force-rm -t "petclinic-prometheus-server:dev" ./docker/prometheus
