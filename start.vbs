'SJIS

set shell=CreateObject("Wscript.Shell")

currentdir = shell.CurrentDirectory ' ���̃t�@�C���̂���f�B���N�g��

msg = ""
msg = msg & "�h�L�������g���[�g�ƂȂ�t�H���_��"
msg = msg & vbCrLf
msg = msg & "�w�肵�Ă��������B"
msg = msg & vbCrLf & vbCrLf
msg = msg & currentdir
msg = msg & " ����̑��΃p�X�ł��B"
msg = msg & "���p�X�ɓ��{�ꓙ���܂܂��Ɠ��삵�܂���B"

path = inputbox(msg, "�h�L�������g���[�g", "html\")
if path = "" then WScript.Quit '�L�����Z����

'�t�H���_�̑��݃`�F�b�N
Set fso = CreateObject("Scripting.FileSystemObject")
If not fso.FolderExists(path) Then
	msgbox "�t�H���_�𐳂����w�肵�Ă��������B",, "�G���["
	WScript.Quit
End If

'�|�[�g�ԍ�
msg = ""
msg = msg & "�|�[�g�ԍ����w�肵�Ă��������B"
msg = msg & vbCrLf & vbCrLf
msg = msg & "3�s�ڂ� Listening on http://127.0.0.1:�` ��"
msg = msg & vbCrLf
msg = msg & "������ʂ��J���Ȃ��ꍇ�͕ύX���K�v�ł��B"

port = inputbox(msg, "�|�[�g�ԍ�", "80")
if port = "" then WScript.Quit '�L�����Z����


'MariaDB�N��
'WordPress�𓮂����Ȃ��Ȃ牺�̍s���R�����g�ɂ��Ă��������B�i�R�����g�ɂ���ƍ�����ʂ�1�ɂȂ�܂��B�j
shell.run "%ComSpec% /c middleware\mariadb\bin\mysqld --console"

'PHP�r���g�C���T�[�o�[�N��
'IE������PHP�r���g�C���T�[�o�[�̉�ʂɕ��������������O���o�邪 chcp 65001 �ł͉������Ȃ������B
shell.run "%ComSpec% /c chcp 65001 & middleware\php\php -S 127.0.0.1:" & port & " -t " & path
'shell.run "%ComSpec% /c php\php -S 127.0.0.1:80 -t html\wp",,True 'True�L�肾�Ǝ��ɐi�܂Ȃ�


WScript.Sleep 1200 '���̃_�C�A���O��������ʂ̗��ɍs���̂��Ȃ�ׂ��h������


'IE�ŃT�C�g��\������iIE�ȊO��WSH�ŊJ���Ȃ��H�j
msg = ""
msg = msg & "IE�ŃT�C�g���J���܂����H"
msg = msg & vbCrLf & vbCrLf
msg = msg & "IE�ȊO�ŊJ���ꍇ��URL���R�s�y���Ă��������B"

ans = inputbox(msg, "�T�C�g�̕\��", "http://127.0.0.1:" & port)
if ans = "" then WScript.Quit '�L�����Z����

Set ie = Wscript.CreateObject("InternetExplorer.Application")
ie.Navigate2 "http://127.0.0.1:" & port
ie.Visible = TRUE
Set ie =Nothing
