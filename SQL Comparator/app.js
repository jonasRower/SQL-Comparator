
//import { ziskejJSON2 } from './mainTree.js';

const express = require("express");
const bodyParser = require('body-parser')
const mysql = require("mysql");
var app = express();


app.set('view engine', 'ejs');
var urlencodedParser = bodyParser.urlencoded({ extended: false });


class Database {
    constructor( ) {
        const config = {
          host: 'localhost',
          user: 'root',
          password: 'jonas',
          database: 'nodejs_login'
        };
        this.connection = mysql.createConnection( config );
    }
    query( sql, args ) {
        return new Promise( ( resolve, reject ) => {
            this.connection.query( sql, args, ( err, rows ) => {
                if ( err )
                    return reject( err );
                resolve( rows );
            } );
        } );
    }
    close() {
        return new Promise( ( resolve, reject ) => {
            this.connection.end( err => {
                if ( err )
                    return reject( err );
                resolve();
            } );
        } );
    }
}


class Data{
    constructor() {
        var rows;
        var rowsR;

        var rowsNew;

    }    
}


class SrovnejDataNaStejneRadky{

    constructor(rowsDelsi, rowsKratsi, odsazovatRadky) {

        this.rowsDelsi = rowsDelsi;
        this.rowsKratsi = rowsKratsi;
        this.odsazovatRadky = odsazovatRadky;

        //console.log(this.rowsDelsi);
       // console.log(this.rowsKratsi);

        this.vratStejneRadky(this.rowsDelsi, this.rowsKratsi)

        this.hlavvniProgramSrovnaniRadku();

    }    


    //vrati JSON se stejnymi radky
    vratStejneRadky(dataOrig, data){

        var stejneRadky = [];
        var radekOrig;
        var radekOrigStr;
        var dataStr;
        var indOf;

        for(var r = 0; r < dataOrig.length; r++){

            //console.log("stejneRadky11");

            radekOrig = dataOrig[r];
            radekOrigStr = JSON.stringify(radekOrig);
            dataStr = JSON.stringify(data);
    
            indOf = dataStr.indexOf(radekOrigStr);

            if(indOf > 0){
               stejneRadky.push(radekOrig)
            }

        }    

        return(stejneRadky);


    }



    hlavvniProgramSrovnaniRadku(){

        var dataOrig;
        dataOrig = this.rowsKratsi;

        //this.rowsNew = this.rowsKratsi;
        this.vkladejRadky(dataOrig);

    }


    //vklada radky, aby data mezi tabulkou vpravo a levo souhlasila
    vkladejRadky(dataOrig){

        var prazdnyRadek;
        var hledejDataZRadku;
        var delka;

        var stejneRadky = [];
        var indexRadku;         //udava index radku ktery je stejny

        var indexZRadku;
        var indexNaRadek;

        var dataOrigStr;
        dataOrigStr = JSON.stringify(dataOrig);
        dataOrig = JSON.parse(dataOrigStr);

        //vrati seznam stejnych radku
        //stejne radky budou na stejnem radku v obou tabulkach
        //ostatni radyk budou posunuty
        stejneRadky = this.vratStejneRadky(this.rowsDelsi, this.rowsKratsi);

        prazdnyRadek = this.vratPraznyRadek();


        console.log("dataOrig");
        console.log(dataOrig);

        delka = dataOrig.length;
        for(var r1 = 0; r1 < delka; r1++){

            hledejDataZRadku = dataOrig[r1];
            indexRadku = this.vratPoradiRadku(stejneRadky, hledejDataZRadku);
            
            if(indexRadku > -1){
                
                indexZRadku = this.vratPoradiRadku(this.rowsKratsi, hledejDataZRadku);
                indexNaRadek = this.vratPoradiRadku(this.rowsDelsi, hledejDataZRadku);

                this.posunRadekZRadkuNaRadek(indexZRadku, indexNaRadek, prazdnyRadek);

            }
        }

        //doplni prazdne radky aby sohlasila delka tabulky vpraco a vlevo
        for(var r = indexNaRadek + 1; r < this.rowsDelsi.length; r++){

            this.rowsKratsi.push(prazdnyRadek);

        }  
        

        if(this.odsazovatRadky == "on"){

            //vlozi radky, tak aby na stejnem radku nebyly rozdilna data
            //v tabulce vpravo a vlevo
            this.vkladejRadkyPredNesouhlasnaData(prazdnyRadek);

            //odstrani ty radky, kde je na stejnem radku vpravo i vlevo null
            this.odstranRadkyNull(prazdnyRadek);

        }


    }


    ////vklada radky, tak aby na stejnem radku v tabilce vpravo a vlevo nebyly rozdilna data
    vkladejRadkyPredNesouhlasnaData(prazdnyRadek){

        var radekTabulkaDelsi;
        var radekTabulkaKratsi;

        var radekTabulkaDelsiStr;
        var radekTabulkaKratsiStr;        
        var prazdnyRadekStr;

        var shoda;

        //porovnava radky jen v pripade, ze radek tabulky vpravo ani leno nejsou null
        //resp. nesjou =prazdnyRadek 
        var porovnavejRadky;

        prazdnyRadekStr = JSON.stringify(prazdnyRadek);

        for(var r = 0; r < this.rowsDelsi.length; r++){

            porovnavejRadky = true;

            radekTabulkaDelsi = this.rowsDelsi[r];
            radekTabulkaKratsi = this.rowsKratsi[r];

            radekTabulkaDelsiStr = JSON.stringify(radekTabulkaDelsi);
            radekTabulkaKratsiStr = JSON.stringify(radekTabulkaKratsi);


            //testuje zda radek neni null
            if(radekTabulkaDelsiStr == prazdnyRadekStr){
                porovnavejRadky = false;
            }
            if(radekTabulkaKratsiStr == prazdnyRadekStr){
                porovnavejRadky = false;
            }

            //pokud radek neni null, pak porovnava zda leva a prava tabulka na 
            //danem radku obsahuje stejna data
            if(porovnavejRadky == true){
                if(radekTabulkaDelsiStr == radekTabulkaKratsiStr){
                    shoda = true;
                }
                else {
                    shoda = false;
                    this.posunRadekZRadkuNaRadek(r, r + 1, prazdnyRadek);
                    this.rowsDelsi.splice(r + 1, 1, prazdnyRadek);
                }
            }

        }

    }


    //odstrani ty radky, kde je null jak v leve tak v prave tabulce (na stejnem radku)
    odstranRadkyNull(prazdnyRadek){

        var radekTabulkaDelsi;
        var radekTabulkaKratsi;

        var radekTabulkaDelsiStr;
        var radekTabulkaKratsiStr;        
        var prazdnyRadekStr;

        var pocetRadkuKratsi;
        var pocetRadkuDelsi;
        var pocetRadku;
        var pocetRadkuK;

        pocetRadkuKratsi = this.rowsKratsi.length;
        pocetRadkuDelsi = this.rowsDelsi.length;

        if(pocetRadkuKratsi < pocetRadkuDelsi){
            pocetRadku = pocetRadkuDelsi;
            pocetRadkuK = pocetRadkuKratsi;
        }
        else {
            pocetRadku = pocetRadkuKratsi;
            pocetRadkuK = pocetRadkuDelsi;
        }


        prazdnyRadekStr = JSON.stringify(prazdnyRadek);;

        console.log("this.rowsDelsi.length");
        console.log(this.rowsKratsi.length);
        
        for(var r = 0; r < pocetRadku; r++){

            radekTabulkaDelsi = this.rowsDelsi[r];
            radekTabulkaKratsi = this.rowsKratsi[r];

            radekTabulkaDelsiStr = JSON.stringify(radekTabulkaDelsi);
            radekTabulkaKratsiStr = JSON.stringify(radekTabulkaKratsi);

            //odstrani radek, pokud vpravo i vlevo = prazdnyRadek 
            if(radekTabulkaDelsiStr == prazdnyRadekStr){
                if(radekTabulkaKratsiStr == prazdnyRadekStr){
                    this.rowsKratsi.splice(r,1);
                    this.rowsDelsi.splice(r,1);
                }
            }            
        }
        
        //----------------------------------------------------------------------------------

        //odstrani taky ten radek, ktery je null a v druhe tabulce je jiz za delkou tabulky     
        for(var r = pocetRadku; r > 0; r--){

            radekTabulkaKratsi = this.rowsKratsi[r];
            radekTabulkaKratsiStr = JSON.stringify(radekTabulkaKratsi);
            console.log(radekTabulkaKratsiStr);

            if(radekTabulkaKratsiStr == prazdnyRadekStr){
                if(r >= pocetRadkuK-1){
                    this.rowsKratsi.splice(-1, 1);
                }
            }    
        }   
         

    }



    posunRadekZRadkuNaRadek(indexZRadku, indexNaRadek, prazdnyRadek){

        for(var r = indexZRadku; r < indexNaRadek; r++){
            this.rowsKratsi = this.vlozPrazdnyRadek(this.rowsKratsi, prazdnyRadek, r);
        }

    }



    vratPoradiRadku(rowsOrig, hledejDataZRadku){

        var dataJednohoRadku;
        var nalezenyRadek;

        for(var r=0; r < rowsOrig.length; r++){
            dataJednohoRadku = rowsOrig[r];

            if(JSON.stringify(dataJednohoRadku) == JSON.stringify(hledejDataZRadku)){
                nalezenyRadek = r;
                break;
            }
        
        }
       
        return(nalezenyRadek);

    }


    vratPraznyRadek(){

        var prazdnyRadek;
        var prazdnyRadekStr;
        var prazdnyObj;

        prazdnyRadek = this.rowsDelsi[0];
        prazdnyRadekStr = JSON.stringify(prazdnyRadek);
       
        console.log("oooooooooooooooooooooooooooooooo");
        console.log(prazdnyRadekStr);
        console.log("oooooooooooooooooooooooooooooooo");

        //pokud je prazdna tabulka vlozi falesna data
        if(prazdnyRadekStr == undefined){
            prazdnyRadekStr = '{"null": "null"}'
        }
        
        prazdnyObj = JSON.parse(prazdnyRadekStr);

        for (var key in prazdnyObj) {
            prazdnyObj[key] = null;
        }

        return(prazdnyObj);

    }


    vlozPrazdnyRadek(radkyOrig, prazdnyRadek, predJakyRadekVkladatRadek){

        radkyOrig.splice(predJakyRadekVkladatRadek, 0, prazdnyRadek);

        return(radkyOrig);

    }

}


app.get('/', function(req, res){

    //prejde na uvodni stranku
    res.render('index');

});  



function vykresliTabulku(dataRows, res, dotazVlevo, dotazVpravo, odsazovatRadky, dotazVlevoPole, dotazVpravoPole){

    var rows = dataRows.rows;
    var rowsR = dataRows.rowsR;

    //srovna data v levem sloupci
    var srovnatData = new SrovnejDataNaStejneRadky(rowsR, rows, odsazovatRadky);

    rows = srovnatData.rowsKratsi;
    rowsR = srovnatData.rowsDelsi;

    //prohodi pravou a levou tabulku a porovna data jeste jednou
    var srovnatData = new SrovnejDataNaStejneRadky(rows, rowsR, odsazovatRadky);

    rows = srovnatData.rowsKratsi;
    rowsR = srovnatData.rowsDelsi;


    //--------------------------------------------------------------------
    //         VYKRESLUJE DANE TABULKY BUD PRAVA NEBO LEVA NEBO OBE
    //--------------------------------------------------------------------


    if(rows.length == 0){
        if(rowsR.length == 0){
            // pokud jsou obe tabulky prazdne
            res.render('emptyTable', { dotazVlevoPole: dotazVlevoPole, dotazVpravoPole: dotazVpravoPole });   
        }
        else{
            // pokud je tabulka vlevo prazdna a v pravo prazna neni
            res.render('emptyTableLeft', { rowsR: rowsR, dotazVpravo: dotazVpravo, dotazVlevoPole: dotazVlevoPole, dotazVpravoPole: dotazVpravoPole });   
        }
    }
    else {
        if(rowsR.length == 0){
            // pokud tabulka vlevo neni prazdna a vpravo je prazdna
            res.render('emptyTableRight', { rows: rows, dotazVlevo: dotazVlevo, dotazVlevoPole: dotazVlevoPole, dotazVpravoPole: dotazVpravoPole});   
        }    
        else{
            // pokud ani jedna tabulka neni prazdna
            res.render('viewTable2', { rows: rows, rowsR: rowsR, dotazVlevo: dotazVlevo, dotazVpravo: dotazVpravo, dotazVlevoPole: dotazVlevoPole, dotazVpravoPole: dotazVpravoPole});   
        }

    }    


    //vykresli data
    //res.render('viewTable2', { rows: rows, rowsR: rowsR, dotazVlevo: dotazVlevo, dotazVpravo: dotazVpravo, dotazVlevoPole: dotazVlevoPole, dotazVpravoPole: dotazVpravoPole});   

}


//odstranuje nepotrebne radky z dotazu, tak, aby dotaz neobsahoval prazdne radky navic
function odstranNepotrebneRadky(dotazRadky, odstranRadek){

    //odstrani radky, ktere obsahuji string odstranRadek
    for(var i=0; i < dotazRadky.length; i++){    
        radek = dotazRadky[i];
        console.log(radek);
        if(radek == odstranRadek){
            dotazRadky[i] = i
            dotazRadky.splice(i, 1)
        }
    }

    return(dotazRadky)

}


function rozdelDotazDoPole(dotaz){

    var dotazRadky

    //rozdeli dotaz na pole radku
    dotazRadky = dotaz.split('\n');
   
    //odstani nepotrebne radky z pole
    dotazRadky = odstranNepotrebneRadky(dotazRadky,'\r')
    dotazRadky = odstranNepotrebneRadky(dotazRadky,'')
    
    return(dotazRadky)

}


//doplni do pole zbyvajici radky, aby pocet radku vlevo i vpravo byl stejny
function doplnDoPoleDotazRadky(dotazPole_A, dotazPole_B){

    var pridatPocetRadku
    var pocetRadku_A
    var pocetRadku_B

    pocetRadku_A = dotazPole_A.length
    pocetRadku_B = dotazPole_B.length


    if(pocetRadku_B > pocetRadku_A){

        pridatPocetRadku = pocetRadku_B - pocetRadku_A
        for(var i=0; i < pridatPocetRadku; i++){    
            dotazPole_A.push("");
        }

    }

    return(dotazPole_A)
   
}


function vratNazpetPokudJsouPrazdnaData(dotaz, res){

    if(dotaz == ''){
        res.render('index');
    }

}


function odstranNezadouciZnaky(dotaz){

    dotaz = dotaz.replace(';', '');
    dotaz = dotaz.replace('\"', '');
    dotaz = dotaz.replace('\"', '');

    return(dotaz)

}



app.get('/novaTabulka', function(req, res){
    res.render('novaTabulka', {data: req.query});
});


app.post('/porovnatDotazy', urlencodedParser, function(req, res){

    var dotazVlevo;
    var dotazVpravo;
    var odsazovatRadky;

    var dataRows = new Data();
    var dbf = new Database();

    var dotazVlevo;
    var dotazVpravo;

    
    var dotazVlevoPole;
    var dotazVpravoPole;

    dotazVlevo = req.body.queryLeft;
    dotazVpravo = req.body.queryRight;
    odsazovatRadky = req.body.odsazovatRadky;

    //obsahuje-li prazdny dotaz, vrati se nazpet a nic nezpracovava
    //vratNazpetPokudJsouPrazdnaData(dotazVlevo, res)
    //vratNazpetPokudJsouPrazdnaData(dotazVpravo, res)

    //odstraní středníky z doztazu, aby dotaz uměl zpracovat
    dotazVlevo = odstranNezadouciZnaky(dotazVlevo)
    dotazVpravo = odstranNezadouciZnaky(dotazVpravo)

    //prevadi dotaz na pole radku, tak aby se zobrazoval prehledne  
    console.log(dotazVlevo)
    console.log(dotazVpravo)

    dotazVlevoPole = rozdelDotazDoPole(dotazVlevo);
    dotazVpravoPole = rozdelDotazDoPole(dotazVpravo);

    //doplni pole dotazu o prazdne radky, tak aby dotaz vlevo i vpravo mel stejny pocet radku
    dotazVlevoPole = doplnDoPoleDotazRadky(dotazVlevoPole, dotazVpravoPole)
    dotazVpravoPole = doplnDoPoleDotazRadky(dotazVpravoPole, dotazVlevoPole)

    //dbf.query( 'SELECT * FROM faktury' )
    dbf.query( dotazVpravo )
        .then( rows => dataRows.rows = rows);  

    dbf.query( dotazVlevo )
    //dbf.query( 'SELECT * FROM faktury' )
        .then( rows => dataRows.rowsR = rows)
        .then( rows => vykresliTabulku(dataRows, res, dotazVlevo, dotazVpravo, odsazovatRadky, dotazVlevoPole, dotazVpravoPole))
        .then( rows => dbf.close() );

});



app.listen(3000, () => {
    console.log("Server started on Port 3000")
});
