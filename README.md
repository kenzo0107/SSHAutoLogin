# SSHAutoLogin
リモートサーバから設定ファイル(projects.yaml)を読み込み、SSHでログインする
 
 
## al.sh (Auto Login)

* サイトエイリアスと環境名を指定してsshログインするシェルです。
 
 
#### 使い方

`sh al.sh <project_alias> <接続環境 (dev|tst|stg|prd)>`
 
 
* ex) Cole Haan のテスト環境に接続

`sh al.sh ch tst`
 
 
 
 
## ac.sh (Auto aCcount)

* サイトエイリアスと環境名を指定してそのサーバ情報や関連情報を表示します。
 
 
#### 使い方

`sh ac.sh <project_alias> <接続環境 (dev|tst|stg|prd)>`
 
 
* ex) 3.1 Philliplim の商用環境情報表示

`sh ac.sh pl tst`

