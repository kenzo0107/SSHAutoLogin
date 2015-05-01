# SSHAutoLogin
リモートサーバから設定ファイル(yaml)を読み込み、SSHでログインする
 
 
## al.sh (Auto Login)

* サイトエイリアスと環境名を指定してsshログインするシェルです。
 
 
#### 使い方

`sh al.sh <project_alias> <接続環境 (dev|tst|stg|prd)>`
 
 
* ex) mameko のテスト環境に接続

`sh al.sh mameko tst`
 
 
 
 
## ac.sh (Auto aCcount)

* サイトエイリアスと環境名を指定してそのサーバ情報や関連情報を表示します。
 
 
#### 使い方

`sh ac.sh <project_alias> <接続環境 (dev|tst|stg|prd)>`
 
 
* ex) mameko の商用環境情報表示

`sh ac.sh mameko tst`

