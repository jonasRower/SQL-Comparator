import vytvorDotazSQL

class nactiZdroHtml():

    def __init__(self, adresaZdroj, indexTabulky):

        poleRadku = self.nacitejSoubor(adresaZdroj)

        # na tyhle data udelat SQL dotazy a vlozit do DB
        self.dataTabulky = self.vratDataTabulky(poleRadku, indexTabulky)






    def getDataTabulky(self):
        return(self.dataTabulky)


    def vratDataTabulky(self, poleRadku, indexTabulky):

        indexyTable = self.vratParoveIndexyRadkuTagu(poleRadku, 'table')

        #ziska vsechny indexy
        indexyTr = self.vratParoveIndexyRadkuTagu(poleRadku, 'tr')
        indexyTh = self.vratParoveIndexyRadkuTagu(poleRadku, 'th')
        indexyTd = self.vratParoveIndexyRadkuTagu(poleRadku, 'td')


        # vrati adekvatni indexy, dle indexu tabulky
        prvniAPosledniIndex = indexyTable[indexTabulky]
        prvniIndex = prvniAPosledniIndex[0]
        posledniIndex = prvniAPosledniIndex[1]

        #ziska jen potrebne indexy
        indexyTrPotrebne = self.vratPouzeTyDvojiceMeziPrvniAPoslednimIndexem(indexyTr, prvniIndex, posledniIndex)
        indexyThPotrebne = self.vratPouzeTyDvojiceMeziPrvniAPoslednimIndexem(indexyTh, prvniIndex, posledniIndex)
        indexyTdPotrebne = self.vratPouzeTyDvojiceMeziPrvniAPoslednimIndexem(indexyTd, prvniIndex, posledniIndex)

        trTdArr = self.vratPoleVsechIndexuRadkuTrTd(indexyTrPotrebne, indexyTdPotrebne)
        trThArr = self.vratPoleVsechIndexuRadkuTrTd(indexyTrPotrebne, indexyThPotrebne)

        poleRadkuHodnotTagTh = self.vratPoleHodnotTabulky(trThArr, poleRadku)
        poleRadkuHodnotTagTd = self.vratPoleHodnotTabulky(trTdArr, poleRadku)


        dataTabulky = []
        dataTabulky.append(poleRadkuHodnotTagTh[0])

        #odebere prvni radek, jelikoz je prazdny
        poleRadkuHodnotTagTd.pop(0)
        dataTabulky.append(poleRadkuHodnotTagTd)

        return(dataTabulky)


    def vratPoleHodnotTabulky(self, trTdArr, poleRadku):

        poleRadkuHodnotTag = []

        for i in range(0, len(trTdArr)):
            indexyRadek = trTdArr[i]
            poleRadkuHodnot = self.vratHodnotyProJedenRadek(indexyRadek, poleRadku)

            poleRadkuHodnotTag.append(poleRadkuHodnot)

        return(poleRadkuHodnotTag)


    def vratHodnotyProJedenRadek(self, indexyRadek, poleRadku):

        poleRadkuHodnot = []

        for i in range(0, len(indexyRadek)):

            try:

                indexRadku = indexyRadek[i][0]
                hodnota = poleRadku[indexRadku]

                hodnota = self.odeberZRadkuTag(hodnota)

                if(hodnota != ''):
                    poleRadkuHodnot.append(hodnota)

            except:
                pass

        return(poleRadkuHodnot)



    def odeberZRadkuTag(self, radek):

        radekNew = radek
        radekNew = radekNew.replace('<td>', '')
        radekNew = radekNew.replace('</td>', '')
        radekNew = radekNew.replace('<th>', '')
        radekNew = radekNew.replace('</th>', '')
        radekNew = radekNew.replace('\n', '')

        radekNew = radekNew.strip()

        return(radekNew)


    def vratPoleVsechIndexuRadkuTrTd(self, indexyTr, indexyTd):

        trTdArr = []

        for i in range(0, len(indexyTr)):
            prvniIndex = indexyTr[i][0]
            posledniIndex = indexyTr[i][1]

            indexyPoterbneTd = self.vratPouzeTyDvojiceMeziPrvniAPoslednimIndexem(indexyTd, prvniIndex, posledniIndex)
            trTdArr.append(indexyPoterbneTd)

        return(trTdArr)


    def vratPouzeTyDvojiceMeziPrvniAPoslednimIndexem(self, dvojiceArr, prvniIndex, posledniIndex):

        dvojiceArrNew = []

        for i in range(0, len(dvojiceArr)):
            dvojice = dvojiceArr[i]
            indOtevreny = dvojice[0]
            indZavreny = dvojice[1]

            if(indOtevreny > prvniIndex):
                if(indZavreny < posledniIndex):
                    dvojiceArrNew.append(dvojice)

        return(dvojiceArrNew)




    def vratParoveIndexyRadkuTagu(self, poleRadku, tag):

        tagOtevreny = '<' + tag
        tagZavreny = '<' + self.vratParovyTag(tag)

        indexyRadkuTaguOtevrenych = self.vratSeznamRadkuObsahujiciSubstring(poleRadku, tagOtevreny)
        indyxyRadkuTaguZavrenych = self.vratSeznamRadkuObsahujiciSubstring(poleRadku, tagZavreny)

        paroveIndexyArr = self.vratParoveIndexy(indexyRadkuTaguOtevrenych, indyxyRadkuTaguZavrenych)

        return(paroveIndexyArr)


    def vratParoveIndexy(self, indexyRadkuTaguOtevrenych, indyxyRadkuTaguZavrenych):

        paroveIndexyArr = []

        for i in range(0, len(indexyRadkuTaguOtevrenych)):
            indexOtevreny = indexyRadkuTaguOtevrenych[i]
            indexZavreny = indyxyRadkuTaguZavrenych[i]

            dvojiceIndexu = []
            dvojiceIndexu.append(indexOtevreny)
            dvojiceIndexu.append(indexZavreny)

            paroveIndexyArr.append(dvojiceIndexu)

        return(paroveIndexyArr)





    def vratParovyTag(self, tag):

        parovyTag = '/' + tag
        return(parovyTag)


    def vratSeznamRadkuObsahujiciSubstring(self, poleRadku, substr):

        indexyRadkuSeSubStr = []

        for i in range(0, len(poleRadku)):
            radek = poleRadku[i]
            radekObsahujeSubstr = self.detekujZdaRadekObsahujeSubstr(radek, substr)

            if(radekObsahujeSubstr == True):
                indexyRadkuSeSubStr.append(i)

        return(indexyRadkuSeSubStr)




    def detekujZdaRadekObsahujeSubstr(self, radek, substr):

        try:
            ind = radek.index(substr)
            radekObsahujeSubstr = True
        except:
            radekObsahujeSubstr = False

        return(radekObsahujeSubstr)



    def nacitejSoubor(self, adresa):

        poleRadku = []

        r = -1
        with open(adresa, 'r') as f:
            for line in f:
                r = r + 1

                # prida radek do tridy Data
                poleRadku.append(line)

        return(poleRadku)


