'�R�}���h�v�����v�g���܂߂āA���̃t�@�C���̂���f�B���N�g�����J�����g�f�B���N�g���ɂȂ�i�͗l�j�B

'IE�����ƍ�����ʂɕ��������������O���o�邪 chcp 65001 �ł͉������Ȃ������B

set shell=CreateObject("Wscript.Shell")

path = inputbox("�h�L�������g���[�g�ƂȂ�t�H���_��" & vbcrlf & "�w�肵�Ă��������B" & vbcrlf & vbcrlf & shell.CurrentDirectory & " ����̑��΃p�X�ł��B" & "���p�X�ɓ��{�ꓙ���܂܂��Ɠ��삵�܂���B", "�h�L�������g���[�g", "html\")
if path = "html\" then path = "html" '�����Ă�������
if path = "" then WScript.Quit '�L�����Z����
'�t�H���_�̑��݃`�F�b�N
Set fso = CreateObject("Scripting.FileSystemObject")
If not fso.FolderExists(path) Then
	msgbox("�t�H���_�𐳂����w�肵�Ă��������B")
	'msgbox(path & " �͑��݂��܂���B", "���݂��Ȃ��t�H���_")
	WScript.Quit
End If
'Set fso = Nothing

port = inputbox("�|�[�g�ԍ����w�肵�Ă��������B" & vbcrlf & vbcrlf & "2�s�ڂ� Listening on http://127.0.0.1:�` ��" & vbcrlf & "������ʂ��J���Ȃ��ꍇ�͕ύX���K�v�ł��B", "�|�[�g�ԍ�", "80")
if port = "" then WScript.Quit '�L�����Z����


'MariaDB�N��
'WordPress�𓮂����Ȃ��Ȃ牺�̍s���R�����g�ɂ��Ă��������B�i�R�����g�ɂ���ƍ�����ʂ�1�ɂȂ�܂��B�j
shell.run "%ComSpec% /c middleware\mariadb\bin\mysqld --console"

'PHP�r���g�C���T�[�o�[�N��
shell.run "%ComSpec% /c chcp 65001 & middleware\php\php -S 127.0.0.1:" & port & " -t " & path
'shell.run "%ComSpec% /c php\php -S 127.0.0.1:80 -t html\wp",,True 'True�L�肾�Ǝ��ɐi�܂Ȃ�


WScript.Sleep 1200 '���̃_�C�A���O��������ʂ̗��ɍs���̂��Ȃ�ׂ��h��


ie = inputbox("IE�ŃT�C�g���J���܂����H" & vbcrlf & vbcrlf & "IE�ȊO�ŊJ���ꍇ��URL���R�s�y���Ă��������B", "�T�C�g�̕\��", "http://127.0.0.1:" & port)
if ie = "" then WScript.Quit '�L�����Z����

Set ie = Wscript.CreateObject("InternetExplorer.Application")
ie.Navigate2 "http://127.0.0.1:" & port
ie.Visible = TRUE
Set ie =Nothing
