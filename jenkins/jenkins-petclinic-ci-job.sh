echo 'Running Unit Tests on Petclinic Application'
docker run --rm -v $HOME/.m2:/root/.m2 -v `pwd`:/app -w /app maven:3.8-openjdk-11 mvn clean test

# bir container olusturucak;
# docker run =container olusturucak
# --rm = kullanilmiyorsa silecek (remove intermediate layer)
# -v = volume olusturacak $Home/.m2(workspace/petclinic-ci-job = Home) workspace ilk jenkins job calistirinca olusucak.her job ismi bir klasor olusturur.
# HOMR = var/lib/jenkins/workspace/<olusan joblarin isimleri>
# :/root/.m2 = container icindeki .m2 dosyasi
# -v $HOME/.m2:/root/.m2 = bu ikisini eslestiriyoruz.dolayisi ile container da olusan hersey localdeki dosyaya gelicek.
# -v `pwd`:/app diger bir volume; 
# 'pwd' = localdeki workspace'in ici.
# :/app = container'da app diye bir dosya
# -w /app = containerdaki /app dosyasini working directory olarak set ettik kunku mvn'in calisacagi bir yer lazim onu set ediyoruz.
# ve orda "maven:3.8-openjdk-11 mvn clean test" komudu calistir.
# kontainerda maven calistirip olusan dosyalari jenkins serverda ayarladigim .m2 dosyasina cekmis oldum. yani hic maven kurmadan isimi hallettim.