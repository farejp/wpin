'�R�}���h�v�����v�g���܂߂āA���̃t�@�C���̂���f�B���N�g�����J�����g�f�B���N�g���ɂȂ�i�͗l�j�B

'IE�����ƍ�����ʂɕ��������������O���o�邪 chcp 65001 �ł͉������Ȃ������B

set shell=CreateObject("Wscript.Shell")

basedir = shell.CurrentDirectory

path = inputbox("��ƃt�H���_���w�肵�Ă��������B" & vbcrlf & "���݂��Ȃ��ꍇ�͍쐬���܂��B" & vbcrlf & vbcrlf & shell.CurrentDirectory & " ����̑��΃p�X�ł��B" & "���p�X�ɓ��{�ꓙ���܂܂��Ɠ��삵�܂���B", "��ƃt�H���_", "html\")
if path = "html\" then path = "html" '�����Ă�������
if path = "" then WScript.Quit '�L�����Z����
'�t�H���_�̑��݃`�F�b�N
Set fso = CreateObject("Scripting.FileSystemObject")
parent = fso.GetParentFolderName(path)
If not fso.FolderExists(parent) Then
	msgbox "�����K�w�̃t�H���_�쐬�ɂ͑Ή����Ă��܂���B", vbInformation, "���m�点"
	WScript.Quit
End If
If not fso.FolderExists(path) Then
	If msgbox("�t�H���_���쐬���܂����H", vbYesNo + vbQuestion + vbDefaultButton2, "�m�F") = vbYes Then
		fso.CreateFolder(path)
	Else
		WScript.Quit
	End If
End If
'Set fso = Nothing

'�J�����g�f�B���N�g���ύX
shell.CurrentDirectory = path

'�R�}���h�����͂�OK���邩�L�����Z������܂ŌJ��Ԃ�
Do
	cmd = inputbox("wp-cli �Ŏ��s����R�}���h����͂��Ă��������B" & vbcrlf & vbcrlf & "�����͂̂܂�OK�܂��̓L�����Z���ŏI�����܂��B" & vbcrlf & vbcrlf & "���͗�F" & vbcrlf & "--info" & vbcrlf & "core version" & vbcrlf & "core download --locale=ja" & vbcrlf & "db cli", "wp-cli")

	If cmd <> "" then
		'wp-cli.phar�����s
		shell.run "%ComSpec% /c chcp 65001 & set PATH=%PATH%;" & basedir & "\middleware\mariadb\bin; & " & basedir & "\middleware\php\php " & basedir & "\tools\wp-cli.phar " & cmd & " & pause"
	End If
Loop While cmd <> ""

'WScript.Echo "���݂̃t�H���_�� " & shell.CurrentDirectory & " �ł��B"
