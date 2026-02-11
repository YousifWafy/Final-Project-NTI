terraform {
  backend "s3" {
    bucket       = "yousif-project-bucket"
    region       = "ap-northeast-2"
    encrypt      = true
    use_lockfile = false
  }
}