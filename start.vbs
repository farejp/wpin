'SJIS

set shell=CreateObject("Wscript.Shell")

currentdir = shell.CurrentDirectory ' このファイルのあるディレクトリ

msg = ""
msg = msg & "ドキュメントルートとなるフォルダを"
msg = msg & vbCrLf
msg = msg & "指定してください。"
msg = msg & vbCrLf & vbCrLf
msg = msg & currentdir
msg = msg & " からの相対パスです。"
msg = msg & "※パスに日本語等が含まれると動作しません。"

path = inputbox(msg, "ドキュメントルート", "html\")
if path = "" then WScript.Quit 'キャンセル時

'フォルダの存在チェック
Set fso = CreateObject("Scripting.FileSystemObject")
If not fso.FolderExists(path) Then
	msgbox "フォルダを正しく指定してください。",, "エラー"
	WScript.Quit
End If

'ポート番号
msg = ""
msg = msg & "ポート番号を指定してください。"
msg = msg & vbCrLf & vbCrLf
msg = msg & "3行目が Listening on http://127.0.0.1:～ の"
msg = msg & vbCrLf
msg = msg & "黒い画面が開かない場合は変更が必要です。"

port = inputbox(msg, "ポート番号", "80")
if port = "" then WScript.Quit 'キャンセル時


'MariaDB起動
'WordPressを動かさないなら下の行をコメントにしてください。（コメントにすると黒い画面は1つになります。）
shell.run "%ComSpec% /c middleware\mariadb\bin\mysqld --console"

'PHPビルトインサーバー起動
'IEを閉じるとPHPビルトインサーバーの画面に文字化けしたログが出るが chcp 65001 では解消しなかった。
shell.run "%ComSpec% /c chcp 65001 & middleware\php\php -S 127.0.0.1:" & port & " -t " & path
'shell.run "%ComSpec% /c php\php -S 127.0.0.1:80 -t html\wp",,True 'True有りだと次に進まない


WScript.Sleep 1200 '下のダイアログが黒い画面の裏に行くのをなるべく防ぐため


'IEでサイトを表示する（IE以外はWSHで開けない？）
msg = ""
msg = msg & "IEでサイトを開きますか？"
msg = msg & vbCrLf & vbCrLf
msg = msg & "IE以外で開く場合はURLをコピペしてください。"

ans = inputbox(msg, "サイトの表示", "http://127.0.0.1:" & port)
if ans = "" then WScript.Quit 'キャンセル時

Set ie = Wscript.CreateObject("InternetExplorer.Application")
ie.Navigate2 "http://127.0.0.1:" & port
ie.Visible = TRUE
Set ie =Nothing
