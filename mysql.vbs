set shell=CreateObject("Wscript.Shell")

'shell.run "%ComSpec% /c echo �R�����g & middleware\mariadb\bin\mysql -uroot -p"
shell.run "%ComSpec% /c middleware\mariadb\bin\mysql -uroot -proot"
