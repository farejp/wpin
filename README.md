# wpin

使ったもの
+ [PHP 7.1 (7.1.10) VC14 x86 Non Thread Safe (2017-Sep-26 23:03:53)](http://windows.php.net/downloads/releases/php-7.1.10-nts-Win32-VC14-x86.zip)  
+ [Xdebug 2.5.5 PHP 7.1 VC14 (32 bit)](https://xdebug.org/files/php_xdebug-2.5.5-7.1-vc14-nts.dll)  
+ [MariaDB 10.2.9 Stable](https://downloads.mariadb.org/interstitial/mariadb-10.2.9/win32-packages/mariadb-10.2.9-win32.zip/from/http%3A//ftp.yz.yamagata-u.ac.jp/pub/dbms/mariadb/)  

やったこと
+ 上記をmiddlewareフォルダに解凍し、できたフォルダをリネーム、xdebugのはphp/extに移動。
+ php/php.iniとmariadb/my.iniを作成
+ mariadbフォルダ内の不要なファイルやフォルダを削除（容量削減のため）
+ start.vbs mysql.bat wp-download.bat作成
+ htmlフォルダ作成、index.php（中身はphpinfo();）作成
+ htmlフォルダlatest-ja.zipをダウンロードして解凍、フォルダをwpにリネーム、wp-config.phpを作成（データベースの情報を設定）

## インストール

[ZIPでダウンロードして](https://github.com/farejp/wpin/archive/master.zip) パスに日本語などを含まない場所に展開（解凍）してください。


### 動作確認環境

* Windows 10

### VCRUNTIME140.dllが見つからないといったエラーが出た場合は [Microsoft Visual C++ 2015 再頒布可能パッケージ Update 3](https://www.microsoft.com/ja-jp/download/details.aspx?id=53840) をインストールしてください。

## 使い方

* start.vbsを開く（実行する）。※セキュリティの警告が出ます。ファイルのプロパティを開いて、ブロックの解除をすると出なくなります。

* ドキュメントルートを指定するダイアログが表示されますので、WordPressの場合は「html\wp」としてOKボタンをクリック。

* ポート番号を指定するダイアログが表示されます。そのままOKボタンをクリック。

* IEでサイトを開きますか？のダイアログが表示されます。とりあえずOKボタンをクリック。

* これでIEが起動して初回はWordPressのセットアップ画面が表示されるはずです。されない場合はポート番号を変更するか、頑張って80番を開放してください。


### ツール

どちらも開く（実行する）と「WindowsによってPCが保護されました」が表示されると思います。詳細情報をクリックして「実行」するか、新しいテキスト ドキュメント.txtを作って中身をコピペしてリネームすると出なくなると思います。

mysql.bat  
中身：middleware\mariadb\bin\mysql -uroot -p  
start.vbsでMariaDBを起動した後に使えます。パスワードはrootです。

wp-download.bat  
中身：bitsadmin.exe /TRANSFER latest-ja https://ja.wordpress.org/latest-ja.zip %CD%\html\latest-ja.zip  
https://ja.wordpress.org/latest-ja.zipをhtmlフォルダにダウンロードします。展開（解凍）は手動でお願いします。
