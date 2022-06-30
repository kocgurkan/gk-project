PATH="$PATH:/usr/local/bin"
# AWS command calistirabilmek icin. AWS /usr/local/bin path'inde calisiyor. hatta terminalde "whereis aws" yazarsak ayni path gelir.
APP_REPO_NAME="clarusway-repo/petclinic-app-dev"
# ECR Repo olusturuyoruz. isminede "clarusway-repo/petclinic-app-dev" dedik.
AWS_REGION="us-east-1"

aws ecr create-repository \ # burasi direk aws documentation'dan "create a ecr repo" link = https://docs.aws.amazon.com/AmazonECR/latest/userguide/getting-started-cli.html
  --repository-name ${APP_REPO_NAME} \
  --image-scanning-configuration scanOnPush=false \ # repoyu olustururken scan yapma
  --image-tag-mutability MUTABLE \ # mutable yani overwrite yapmaya izin veriyor.yeni image yolladigimizda uzerine yaziyor.
  --region ${AWS_REGION}