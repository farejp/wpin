'SJIS

set shell=CreateObject("Wscript.Shell")

currentdir = shell.CurrentDirectory ' ���̃t�@�C���̂���f�B���N�g��

cmd = ""
cmd = cmd & "%ComSpec% " ' cmd.exe
cmd = cmd & "/k " ' /c ���s���ʂ���� /k ���Ȃ�
cmd = cmd & "chcp 65001 " ' UTF-8 �s�v�����A�����̃R�}���h�𑱂���ꍇ & �łȂ�
cmd = cmd & "& " ' wp-cli
cmd = cmd & "doskey wp=" & currentdir & "\middleware\php\php.exe " & currentdir & "\tools\wp-cli.phar $* "
cmd = cmd & "& " ' phpunit
cmd = cmd & "doskey phpunit=" & currentdir & "\middleware\php\php.exe " & currentdir & "\tools\phpunit.phar $* " ' $*�͈����p
cmd = cmd & "& " ' ls��ll�͂��܂�
cmd = cmd & "doskey ls=dir $* "
cmd = cmd & "& "
cmd = cmd & "doskey ll=dir $* "
cmd = cmd & "& " ' php.exe��mysql.exe�Ƀp�X��ʂ�
cmd = cmd & "set PATH=%PATH%;" & currentdir & "\middleware\php;" & currentdir & "\middleware\mariadb\bin;"

shell.run cmd
