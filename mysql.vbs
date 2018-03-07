set shell=CreateObject("Wscript.Shell")

'shell.run "%ComSpec% /c echo ƒRƒƒ“ƒg & middleware\mariadb\bin\mysql -uroot -p"
shell.run "%ComSpec% /c middleware\mariadb\bin\mysql -uroot -proot"
