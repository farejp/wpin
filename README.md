# wpin

使ったもの
+ [PHP 7.1 (7.1.10) VC14 x86 Non Thread Safe (2017-Sep-26 23:03:53)](http://windows.php.net/downloads/releases/php-7.1.10-nts-Win32-VC14-x86.zip)  
+ [Xdebug 2.5.5 PHP 7.1 VC14 (32 bit)](https://xdebug.org/files/php_xdebug-2.5.5-7.1-vc14-nts.dll)  
+ [MariaDB 10.2.13 Stable (32 bit)](http://ftp.yz.yamagata-u.ac.jp/pub/dbms/mariadb//mariadb-10.2.13/win32-packages/mariadb-10.2.13-win32.zip)  

やったこと
+ 上記をmiddlewareフォルダに解凍し、できたフォルダをリネーム、xdebugのはphp/extに移動。
+ php/php.iniとmariadb/my.iniを作成
+ mariadbフォルダ内の不要なファイルやフォルダを削除（容量削減のため）
+ start.vbs、mysql.bat、wp-download.bat作成（ダウンロードしたフラグが立って今のとこちょっと面倒です。）
+ htmlフォルダ作成、index.php（中身はphpinfo();）作成
+ htmlフォルダlatest-ja.zipをダウンロードして解凍、フォルダをwpにリネーム、wp-config.phpを作成（データベースの情報を設定）

できること
+ ダウンロードして解凍するだけでWindowsでWordPressを動かせます。ローカルなので修正も楽々です。
+ wp-cliを使ってWordPressのインストールが可能です。
+ composerを使ってその他色々とインストールが可能です。
+ Xdebug入りで設定済みですので、すぐにデバッグが可能です。htmlフォルダにはVisual Studio CodeのPHP Debugの設定ファイルを入れてあります。
+ WordPressのパーマリンクの設定からindex.phpを抜いてもリライトしてくれます。理由は把握していません……
+ Laravel、EC-CUBE 3.0、concrete5およびDrupalなども一応動きました。

## インストール

[ZIPでダウンロードして](https://github.com/farejp/wpin/archive/master.zip) パスに日本語などを含まない場所に展開（解凍）してください。


### 動作確認環境

* Windows 10

#### VCRUNTIME140.dllが見つからないといったエラーが出た場合は [Microsoft Visual C++ 2015 再頒布可能パッケージ Update 3](https://www.microsoft.com/ja-jp/download/details.aspx?id=53840) のx86の方をインストールしてください。

## 使い方

* start.vbsを開く（実行する）。※セキュリティの警告が出ます。ファイルのプロパティを開いて、ブロックの解除をすると出なくなります。

* ドキュメントルートを指定するダイアログが表示されますので、とりあえずそのままOKボタンをクリック。

* ポート番号を指定するダイアログが表示されます。そのままOKボタンをクリック。

* IEでサイトを開きますか？のダイアログが表示されます。とりあえずOKボタンをクリック。

* これでIEが起動して phpinfo() の画面が表示されるはずです。されない場合はポート番号を変更するか、頑張って80番を開放してください。
* これで html フォルダをドキュメントルートとしてWEBサーバーとデータベースサーバーが起動した状態です。

### ツール

Windows 10だとbatファイルを激しく拒否してくるのでWSHで作り直しました。

#### cli-tools.vbs
git、composer、wp-cliおよびphpunitなどにパスを通して簡単に使えるようにしてあります。実体はtoolsフォルダに勝手に入れてあります。※gitはデフォルトのインストール先を想定。  
例えば git --version、wp --version、phpunit --versionおよびcomposer --version などそれぞれ実行してみてください。詳しくは別で書きます。


#### mysql.vbs
中身は middleware\mariadb\bin\mysql -uroot -proot です。  
start.vbsでMariaDBを起動した後に使えます。

