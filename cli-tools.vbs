'SJIS

set shell=CreateObject("Wscript.Shell")

currentdir = shell.CurrentDirectory ' このファイルのあるディレクトリ

cmd = ""
cmd = cmd & "%ComSpec% " ' cmd.exe
cmd = cmd & "/k " ' /c 実行後画面を閉じる /k 閉じない
cmd = cmd & "chcp 65001 " ' UTF-8 不要かも、複数のコマンドを続ける場合 & でつなぐ
cmd = cmd & "& " ' php.exe、mysql.exe、git.exeにパスを通す
cmd = cmd & "set PATH=%PATH%;" & currentdir & "\middleware\php;" & currentdir & "\middleware\mariadb\bin;%ProgramFiles%\Git\cmd; "
cmd = cmd & "& " ' Composer
cmd = cmd & "doskey composer=php.exe " & currentdir & "\tools\composer.phar $* " ' $*は引数用
cmd = cmd & "& " ' wp-cli
cmd = cmd & "doskey wp=php.exe " & currentdir & "\tools\wp-cli.phar $* "
cmd = cmd & "& " ' phpunit
cmd = cmd & "doskey phpunit=php.exe " & currentdir & "\tools\phpunit.phar $* "
cmd = cmd & "& " ' lsとllはおまけ
cmd = cmd & "doskey ls=dir $* "
cmd = cmd & "& "
cmd = cmd & "doskey ll=dir $* "
cmd = cmd & "& cd html" ' 要検討
shell.run cmd
