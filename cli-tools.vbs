'SJIS

set shell=CreateObject("Wscript.Shell")

currentdir = shell.CurrentDirectory ' ���̃t�@�C���̂���f�B���N�g��

cmd = ""
cmd = cmd & "%ComSpec% " ' cmd.exe
cmd = cmd & "/k " ' /c ���s���ʂ���� /k ���Ȃ�
cmd = cmd & "chcp 65001 " ' UTF-8 �s�v�����A�����̃R�}���h�𑱂���ꍇ & �łȂ�
cmd = cmd & "& " ' php.exe�Amysql.exe�Agit.exe�Ƀp�X��ʂ�
cmd = cmd & "set PATH=%PATH%;" & currentdir & "\middleware\php;" & currentdir & "\middleware\mariadb\bin;%ProgramFiles%\Git\cmd; "
cmd = cmd & "& " ' Composer
cmd = cmd & "doskey composer=php.exe " & currentdir & "\tools\composer.phar $* " ' $*�͈����p
cmd = cmd & "& " ' wp-cli
cmd = cmd & "doskey wp=php.exe " & currentdir & "\tools\wp-cli.phar $* "
cmd = cmd & "& " ' phpunit
cmd = cmd & "doskey phpunit=php.exe " & currentdir & "\tools\phpunit.phar $* "
cmd = cmd & "& " ' ls��ll�͂��܂�
cmd = cmd & "doskey ls=dir $* "
cmd = cmd & "& "
cmd = cmd & "doskey ll=dir $* "
cmd = cmd & "& cd html" ' �v����
shell.run cmd
