import ziskejDatoveTypySloupcu

class SQLDotazy():

    def __init__(self, dataTabulkyAll):

        nazevTabulky = "tabTest"

        dataHlavicky = dataTabulkyAll[0]
        dataTabulky = dataTabulkyAll[1]

        ziskejDatoveTypy = ziskejDatoveTypySloupcu.datoveTypy(dataTabulky)
        datatoveTypy = ziskejDatoveTypy.getDatoveTypySloupcu()

        #je treba prekonvertovat datum
        self.nazvyMesicu = self.vratNazvyMesicu()

        # prekonvertuje datum
        dataTabulky = self.prekonvertujDatum(dataTabulky, datatoveTypy)

        createTableSQL = self.vytvorCreateTable(dataHlavicky, datatoveTypy, nazevTabulky)
        SQLDotazArr = self.vytvorPoleRadkuInsertInto(dataTabulky, dataHlavicky, nazevTabulky)

        SQLdotazy = []
        SQLdotazy.append(createTableSQL)
        self.SQLdotazy = SQLdotazy + SQLDotazArr



    def getSQLdotazy(self):
        return(self.SQLdotazy)


    def vytvorPoleRadkuInsertInto(self, dataTabulky, dataHlavicky, nazevTabulky):

        SQLDotazArr = []
        nazvySloupcuStr = self.vratNazvySloupcuStr(dataHlavicky)

        for i in range(0, len(dataTabulky)):
            radekTabulky = dataTabulky[i]
            valuesStr = self.vratNazvySloupcuStr(radekTabulky)

            SQLDotaz = "INSERT INTO " + nazevTabulky + nazvySloupcuStr + ' VALUES ' + valuesStr + ';'
            SQLDotazArr.append(SQLDotaz)

        return(SQLDotazArr)



    def vytvorInsertInto(self, radekTabulky, dataHlavicky, nazevTabulky):

        nazvySloupcuStr = self.vratNazvySloupcuStr(dataHlavicky)
        valesStr = self.vratNazvySloupcuStr(radekTabulky)

        SQLDotaz = "INSERT INTO " + nazevTabulky + nazvySloupcuStr + ' VALUES ' + valesStr



        for i in range(0, len(dataHlavicky)):
            nazevSloupce = dataHlavicky[i]
            hodnota = radekTabulky[i]



        print()

    def vratNazvySloupcuStr(self, data):

        nazvySloupcuStr = '('

        for i in range(0, len(data)):

            if (i > 0):
                nazvySloupcuStr = nazvySloupcuStr + ', '

            nazevSloupce = data[i]
            nazvySloupcuStr = nazvySloupcuStr + nazevSloupce

        nazvySloupcuStr = nazvySloupcuStr + ')'
        return (nazvySloupcuStr)


    def vytvorCreateTable(self, dataHlavicky, datatoveTypy, nazevTabulky):

        SQLDotaz = 'CREATE TABLE ' + nazevTabulky
        sloupecDatTyp = ''

        for i in range(0, len(dataHlavicky)):

            if(i > 0):
                sloupecDatTyp = sloupecDatTyp + ', '

            nazevSloupce = dataHlavicky[i]
            try:
                datovyTypSloupce = datatoveTypy[i]
            except:
                datovyTypSloupce = 'String'

            if(datovyTypSloupce == 'String'):
                datovyTypSloupce = 'varchar(255)'

            sloupecDatTyp = sloupecDatTyp + nazevSloupce + ' ' + datovyTypSloupce


        SQLDotaz = SQLDotaz + ' (' + sloupecDatTyp + ');'

        return(SQLDotaz)



    # v mysl je jiny format date
    def prekonvertujDatum(self, dataTabulky, datoveTypy):

        dataTabulkyNew = []

        for i in range(0, len(dataTabulky)):
            radek = dataTabulky[i]
            radekNew = self.vratPrekonverovanaDataRadku(radek, datoveTypy)

            dataTabulkyNew.append(radekNew)

        return(dataTabulkyNew)


    def vratPrekonverovanaDataRadku(self, radek, datoveTypy):

        """
        #prepisuji datove typy, jelikoz nekde je chyba
        datoveTypy = []
        datoveTypy.append('String')
        datoveTypy.append('Int')
        datoveTypy.append('Date')
        datoveTypy.append('Date')
        datoveTypy.append('Float')
        datoveTypy.append('Date')
        datoveTypy.append('String')
        """

        radekNew = []

        for i in range(0, len(radek)):
            datovyTyp = datoveTypy[i]
            hodnota = radek[i]

            hodnotaNew = hodnota

            if(datovyTyp == 'Date'):
                hodnotaNew = self.prekonvertujHodnotu(hodnota)

            hodnotaNew = self.doplnUvozovky(hodnotaNew, datovyTyp)

            radekNew.append(hodnotaNew)

        return(radekNew)


    def doplnUvozovky(self, hodnota, datovyTyp):

        hodnotaNew = hodnota

        if(datovyTyp == 'Date'):
            hodnotaNew = '"' + hodnota + '"'

        if(datovyTyp == 'String'):
            hodnotaNew = '"' + hodnota + '"'

        return(hodnotaNew)


    def prekonvertujHodnotu(self, hodnota):

        hodnotaSpl = hodnota.split(' ')

        try:
            mesic = hodnotaSpl[1]
            den = int(hodnotaSpl[2])
            rok = hodnotaSpl[3]

            mesicNew = self.prekonvertujNazevMesice(mesic)
            denNew = self.doplnNaDvojcislo(den)
            rokNew = str(rok)

            datumNew = rokNew + '-' + mesicNew + '-' + denNew

        except:
            datumNew = hodnota

        return(datumNew)


    def prekonvertujNazevMesice(self, mesic):

        indMesic = self.nazvyMesicu.index(mesic)
        mesicNew = self.doplnNaDvojcislo(indMesic)

        return(mesicNew)


    def doplnNaDvojcislo(self, cisloInt):

        if (cisloInt < 10):
            cisloNew = '0' + str(cisloInt)
        else:
            cisloNew = str(cisloInt)

        return (cisloNew)









    def vratNazvyMesicu(self):

        nazvyMesicu = []
        nazvyMesicu.append('Jan')
        nazvyMesicu.append('Feb')
        nazvyMesicu.append('Mar')
        nazvyMesicu.append('Apr')
        nazvyMesicu.append('May')
        nazvyMesicu.append('Jun')
        nazvyMesicu.append('Jul')
        nazvyMesicu.append('Aug')
        nazvyMesicu.append('Sep')
        nazvyMesicu.append('Oct')
        nazvyMesicu.append('Nov')
        nazvyMesicu.append('Dec')

        return (nazvyMesicu)