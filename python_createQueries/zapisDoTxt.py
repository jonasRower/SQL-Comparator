class txtOutput():

    def __init__(self, SQLDotazArr, adresa):
        self.tiskniDataDoTxt(SQLDotazArr, adresa)


    def tiskniDataDoTxt(self, dataKTisku, adresa):
        dataWrite = ""

        f = open(adresa, 'w')

        for i in range(0, len(dataKTisku)):
            radek = str(dataKTisku[i])

            dataWrite = dataWrite + radek + '\n'

        f.write(dataWrite)
        f.close()


