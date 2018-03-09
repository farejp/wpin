'SJIS

set shell=CreateObject("Wscript.Shell")

currentdir = shell.CurrentDirectory ' このファイルのあるディレクトリ

cmd = ""
cmd = cmd & "%ComSpec% " ' cmd.exe
cmd = cmd & "/k " ' /c 実行後画面を閉じる /k 閉じない
cmd = cmd & "chcp 65001 " ' UTF-8 不要かも、複数のコマンドを続ける場合 & でつなぐ
cmd = cmd & "& " ' wp-cli
cmd = cmd & "doskey wp=" & currentdir & "\middleware\php\php.exe " & currentdir & "\tools\wp-cli.phar $* "
cmd = cmd & "& " ' phpunit
cmd = cmd & "doskey phpunit=" & currentdir & "\middleware\php\php.exe " & currentdir & "\tools\phpunit.phar $* " ' $*は引数用
cmd = cmd & "& " ' lsとllはおまけ
cmd = cmd & "doskey ls=dir $* "
cmd = cmd & "& "
cmd = cmd & "doskey ll=dir $* "
cmd = cmd & "& " ' php.exeとmysql.exeにパスを通す
cmd = cmd & "set PATH=%PATH%;" & currentdir & "\middleware\php;" & currentdir & "\middleware\mariadb\bin;"

shell.run cmd
