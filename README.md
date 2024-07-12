# JoyfulJournal
『JoyfulJournal』は日記を書こうとしている人のための日記アプリです。
## 画面キャプチャ
## 機能一覧

## 使用技術
* フロントエンド
  * HTML/CSS
  * Javascript
* バックエンド
  * Ruby 3.2.2
  * Ruby on Rails 7.0.8
* インフラ
  * AWS(EC2,VPC,ALB,RDS,S3,Route53,ACM)
  * Nginx
  * Unicorn
## ER図
## インフラ構成図
![インフラ構成図](../documents/infrastructure.png)
## 工夫した点
* 使いやすく、シンプルなインターフェイス。
* ログイン後に当日の日記投稿の精査によって遷移画面が変わる仕組み。
* 一覧画面でのキャラクター表示（その日のスタンプによってコメントが変わる）。
* バリデーションが整っていて、スタンプを選択しないと日記を投稿できない。