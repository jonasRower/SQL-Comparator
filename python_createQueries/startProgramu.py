import nactiHtml
import vytvorDotazSQL
import zapisDoTxt


adresaZdroj = 'C:\\Users\\jonas\\OneDrive\\Dokumenty\\2023\\SQL\\SQL queries\\SQL-Queries-main\\Dotazy\\5.html'
adresaCil = "C:\\Users\\jonas\\OneDrive\\Dokumenty\\2023\\SQL\\mysql_Queries\\1.txt"

indexTabulky = 1

dataZHtml = nactiHtml.nactiZdroHtml(adresaZdroj, indexTabulky)
dataTabulky = dataZHtml.getDataTabulky()

SQL = vytvorDotazSQL.SQLDotazy(dataTabulky)
SQLdotazy = SQL.getSQLdotazy()

zapisDoTxt.txtOutput(SQLdotazy, adresaCil)

print()

