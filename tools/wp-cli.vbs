'コマンドプロンプトも含めて、このファイルのあるディレクトリがカレントディレクトリになる（模様）。

'IEを閉じると黒い画面に文字化けしたログが出るが chcp 65001 では解消しなかった。

set shell=CreateObject("Wscript.Shell")

basedir = shell.CurrentDirectory

path = inputbox("作業フォルダを指定してください。" & vbcrlf & "存在しない場合は作成します。" & vbcrlf & vbcrlf & shell.CurrentDirectory & " からの相対パスです。" & "※パスに日本語等が含まれると動作しません。", "作業フォルダ", "html\")
if path = "html\" then path = "html" '無くても動くが
if path = "" then WScript.Quit 'キャンセル時
'フォルダの存在チェック
Set fso = CreateObject("Scripting.FileSystemObject")
parent = fso.GetParentFolderName(path)
If not fso.FolderExists(parent) Then
	msgbox "複数階層のフォルダ作成には対応していません。", vbInformation, "お知らせ"
	WScript.Quit
End If
If not fso.FolderExists(path) Then
	If msgbox("フォルダを作成しますか？", vbYesNo + vbQuestion + vbDefaultButton2, "確認") = vbYes Then
		fso.CreateFolder(path)
	Else
		WScript.Quit
	End If
End If
'Set fso = Nothing

'カレントディレクトリ変更
shell.CurrentDirectory = path

'コマンド未入力でOKするかキャンセルするまで繰り返す
Do
	cmd = inputbox("wp-cli で実行するコマンドを入力してください。" & vbcrlf & vbcrlf & "未入力のままOKまたはキャンセルで終了します。" & vbcrlf & vbcrlf & "入力例：" & vbcrlf & "--info" & vbcrlf & "core version" & vbcrlf & "core download --locale=ja" & vbcrlf & "db cli", "wp-cli")

	If cmd <> "" then
		'wp-cli.pharを実行
		shell.run "%ComSpec% /c chcp 65001 & set PATH=%PATH%;" & basedir & "\middleware\mariadb\bin; & " & basedir & "\middleware\php\php " & basedir & "\tools\wp-cli.phar " & cmd & " & pause"
	End If
Loop While cmd <> ""

'WScript.Echo "現在のフォルダは " & shell.CurrentDirectory & " です。"
