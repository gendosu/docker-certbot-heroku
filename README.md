# Overview

主にherokuで動いているもののLet's Encryptを取得、更新するために使用する

# 使い方

対象になるherokuのアプリには、あらかじめ、環境変数「LETS_ENCRYPT_CHALLENGE」が存在したら  
/.well-known/acme-challenge/:id
のroutesが有効になり、
LETS_ENCRYPT_CHALLENGEの内容がbodyに埋め込まれたページが表示されるように組み込み済みである事が前提。  
※ :idはなんでも良い

### リポジトリをcloneする

```
git clone https://github.com/gendosu/docker-certbot-heroku.git
```

### コンテナを起動する

```
$> docker-compose run --rm main bash
```
でコンテナのbashに入る

### あらかじめherokuにログインしておく

コンテナ内でherokuにログインする
```
container$> heroku login
```

### certbotコマンドの実行 (Let's Encrypt化初回の場合)

コンテナ内でcertbotコマンドを実行する
```
container$> certbot install --installer certbot-heroku:heroku -H sample_app -d sample.domain
```

### certbotコマンドの内容

このコマンドで実行される内容は

- ドメインの認証開始
- ワンタイムトークン取得
- herokuの環境変数[LETS_ENCRYPT_CHALLENGE]にワンタイムトークンを設定
- ワンタイムトークン認証
- 証明書の発行
- heroku certsで証明書の設定

