'コマンドプロンプトも含めて、このファイルのあるディレクトリがカレントディレクトリになる（模様）。

'IEを閉じると黒い画面に文字化けしたログが出るが chcp 65001 では解消しなかった。

set shell=CreateObject("Wscript.Shell")

path = inputbox("ドキュメントルートとなるフォルダを" & vbcrlf & "指定してください。" & vbcrlf & vbcrlf & shell.CurrentDirectory & " からの相対パスです。" & "※パスに日本語等が含まれると動作しません。", "ドキュメントルート", "html\")
if path = "html\" then path = "html" '無くても動くが
if path = "" then WScript.Quit 'キャンセル時
'フォルダの存在チェック
Set fso = CreateObject("Scripting.FileSystemObject")
If not fso.FolderExists(path) Then
	msgbox("フォルダを正しく指定してください。")
	'msgbox(path & " は存在しません。", "存在しないフォルダ")
	WScript.Quit
End If
'Set fso = Nothing

port = inputbox("ポート番号を指定してください。" & vbcrlf & vbcrlf & "2行目が Listening on http://127.0.0.1:～ の" & vbcrlf & "黒い画面が開かない場合は変更が必要です。", "ポート番号", "80")
if port = "" then WScript.Quit 'キャンセル時


'MariaDB起動
'WordPressを動かさないなら下の行をコメントにしてください。（コメントにすると黒い画面は1つになります。）
shell.run "%ComSpec% /c middleware\mariadb\bin\mysqld --console"

'PHPビルトインサーバー起動
shell.run "%ComSpec% /c chcp 65001 & middleware\php\php -S 127.0.0.1:" & port & " -t " & path
'shell.run "%ComSpec% /c php\php -S 127.0.0.1:80 -t html\wp",,True 'True有りだと次に進まない


WScript.Sleep 1200 '下のダイアログが黒い画面の裏に行くのをなるべく防ぐ


ie = inputbox("IEでサイトを開きますか？" & vbcrlf & vbcrlf & "IE以外で開く場合はURLをコピペしてください。", "サイトの表示", "http://127.0.0.1:" & port)
if ie = "" then WScript.Quit 'キャンセル時

Set ie = Wscript.CreateObject("InternetExplorer.Application")
ie.Navigate2 "http://127.0.0.1:" & port
ie.Visible = TRUE
Set ie =Nothing
