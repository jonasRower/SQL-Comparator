class datoveTypy():

    def __init__(self, dataTabulky):

        tabulkyPoSloupcich = self.rozdelTabulkuPoSloupcich(dataTabulky)
        self.datoveTypySloupcu = self.vratDatoveTypySloupcu(tabulkyPoSloupcich)



    def getDatoveTypySloupcu(self):
        return(self.datoveTypySloupcu)


    def rozdelTabulkuPoSloupcich(self, dataTabulky):

        tabulkyPoSloupcich = []
        pocetSloupcu = len(dataTabulky[0])

        for i in range(0, pocetSloupcu):
            sloupecTabulky = self.vratSloupecTabulky(dataTabulky, i)
            tabulkyPoSloupcich.append(sloupecTabulky)

        return (tabulkyPoSloupcich)



    def vratSloupecTabulky(self, tabulka, indexSloupce):

        sloupecTabulky = []

        for i in range(0, len(tabulka)):
            radekTabulky = tabulka[i]

            try:
                hodnota = radekTabulky[indexSloupce]
            except:
                hodnota = ""

            sloupecTabulky.append(hodnota)

        return (sloupecTabulky)

    def vratDatoveTypySloupcu(self, tabulkyPoSloupcich):

        datoveTypySloupcu = []

        nazvyDni = self.vratNazvyDni()
        nazvyMesicu = self.vratNazvyMesicu()

        for i in range(0, len(tabulkyPoSloupcich)):
            sloupecTabulky = tabulkyPoSloupcich[i]
            datoveTypySloupce = self.vratDatoveTypySloupce(sloupecTabulky, nazvyDni, nazvyMesicu)

            polozkyJsouStejne = self.detekujZdaCelySloupecJeStejnehoDatovehoTypu(datoveTypySloupce)
            if (polozkyJsouStejne == True):
                datovyTyp = datoveTypySloupce[0]
            else:
                datovyTyp = "String"

            datoveTypySloupcu.append(datovyTyp)

        return (datoveTypySloupcu)

    def detekujZdaCelySloupecJeStejnehoDatovehoTypu(self, datoveTypySloupce):

        typExp = datoveTypySloupce[0]
        polozkyJsouStejne = True

        for i in range(1, len(datoveTypySloupce)):
            typ = datoveTypySloupce[i]
            if (typ != typExp):
                polozkyJsouStejne = False
                break

        return (polozkyJsouStejne)


    def vratDatoveTypySloupce(self, sloupecTabulky, nazvyDni, nazvyMesicu):

        datoveTypySloupce = []
        datovyTyp = "String"

        for i in range(0, len(sloupecTabulky)):
            polozka = sloupecTabulky[i]
            jednaSeODatum = self.detekujZdaSeJednaODatum(polozka, nazvyDni, nazvyMesicu)
            jednaSeOInt = self.detekujZdaSeJednaOInt(polozka)
            jednaSeOFloat = self.detekujZdaSeJednaOFloat(polozka)

            if (jednaSeODatum == True):
                datovyTyp = "Date"

            if (jednaSeOInt == True):
                datovyTyp = "Int"

            if(jednaSeOFloat == True):
                datovyTyp = "Float"

            datoveTypySloupce.append(datovyTyp)

        return (datoveTypySloupce)


    def detekujZdaSeJednaOFloat(self, polozka):

        try:
            ind = polozka.index('.')
            jednaSeOFloat = True
        except:
            jednaSeOFloat = False

        return(jednaSeOFloat)


    def detekujZdaSeJednaOInt(self, polozka):

        try:
            polozkaInt = int(polozka)
            jednaSeOInt = True
        except:
            jednaSeOInt = False

        return (jednaSeOInt)

    def detekujZdaSeJednaODatum(self, polozka, nazvyDni, nazvyMesicu):

        polozkaSpl = polozka.split(' ')

        try:

            den = polozkaSpl[0]
            mesic = polozkaSpl[1]

            jeToDen = self.detekujZdaJePolozkaVPoli(nazvyDni, den)
            jeToMesic = self.detekujZdaJePolozkaVPoli(nazvyMesicu, mesic)

            jednaSeODatum = False

            if (jeToDen == True):
                if (jeToMesic == True):
                    jednaSeODatum = True

        except:

            jednaSeODatum = False

        return (jednaSeODatum)

    def detekujZdaJePolozkaVPoli(self, pole, polozka):

        try:
            ind = pole.index(polozka)
            polozkaJeVPoli = True
        except:
            polozkaJeVPoli = False

        return (polozkaJeVPoli)

    def vratNazvyDni(self):

        nazvyDni = []
        nazvyDni.append('Mon')
        nazvyDni.append('Tue')
        nazvyDni.append('Wed')
        nazvyDni.append('Thu')
        nazvyDni.append('Fri')
        nazvyDni.append('Sat')
        nazvyDni.append('Sun')

        return (nazvyDni)

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

