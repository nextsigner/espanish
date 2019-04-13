var vocales=[]
var consonantes=[]
var silabas=[]
var jsonSil=''
function addSilabaCVC(c1, c2){
    for(var i=0; i<vocales.length;i++){
        silabas.push(c1+vocales[i]+c2)
    }
}
function addSilabaDosConsonantes(c1, c2){
    for(var i=0; i<vocales.length;i++){
        silabas.push(c1+c2+vocales[i])
    }
}
function addSilabaDosConsonantesVocalConsonante(c1, c2, c3){
    for(var i=0; i<vocales.length;i++){
        silabas.push(c1+c2+vocales[i]+c3)
    }
}
function setSil(){
    var data=''
    vocales=['a', 'e', 'i', 'o', 'u']
    consonantes=['b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'll', 'm', 'n', 'ñ', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'y', 'z']

    for(var i=0; i<vocales.length;i++){
        silabas.push(vocales[i])
    }

    for(var i=0; i<consonantes.length;i++){
        //console.log('Silabas---------'+consonantes[i])
        for(var i2=0; i2<vocales.length;i2++){
           //console.log(consonantes[i]+vocales[i2])
            if(''+consonantes[i]!=='q'){
                silabas.push(''+consonantes[i]+vocales[i2])
            }
        }
    }


    //Agregando sìlabas de 2 consonantes
    addSilabaDosConsonantes('b', 'l')
    addSilabaDosConsonantes('b', 'r')
    addSilabaDosConsonantes('c', 'h')
    addSilabaDosConsonantes('c', 'l')
    addSilabaDosConsonantes('c', 'r')
    addSilabaDosConsonantes('d', 'r')
    addSilabaDosConsonantes('f', 'l')
    addSilabaDosConsonantes('f', 'r')
    addSilabaDosConsonantes('g', 'l')
    addSilabaDosConsonantes('g', 'r')
    addSilabaDosConsonantes('t', 'l')
    addSilabaDosConsonantes('t', 'r')

    //Agregando sìlabas consonante vocal consonante
    addSilabaCVC('l', 'c')
    addSilabaCVC('l', 'm')
    addSilabaCVC('l', 'n')
    addSilabaCVC('l', 'p')
    addSilabaCVC('l', 'r')
    addSilabaCVC('l', 's')
    addSilabaCVC('l', 'z')
    addSilabaCVC('p', 'l')
    addSilabaCVC('p', 'r')
    addSilabaCVC('r', 'c')
    addSilabaCVC('r', 'l')
    addSilabaCVC('r', 'n')
    addSilabaCVC('r', 'p')
    addSilabaCVC('r', 'r')
    addSilabaCVC('r', 's')
    addSilabaCVC('r', 'z')
    addSilabaCVC('t', 'l')
    addSilabaCVC('t', 'r')

    //Agregando silabas con letra q
    silabas.push('que')
    silabas.push('qui')
    silabas.push('quie')
    silabas.push('quio')

    //Agregando sìlabas de 3 consonantes 1 vocal en anteùltimo lugar
    addSilabaDosConsonantesVocalConsonante('b', 'l', 'n')
    addSilabaDosConsonantesVocalConsonante('b', 'r', 'n')
    addSilabaDosConsonantesVocalConsonante('c', 'h', 'n')
    addSilabaDosConsonantesVocalConsonante('c', 'l', 'n')
    addSilabaDosConsonantesVocalConsonante('c', 'r', 'n')
    addSilabaDosConsonantesVocalConsonante('d', 'r', 'n')
    addSilabaDosConsonantesVocalConsonante('f', 'l', 'n')
    addSilabaDosConsonantesVocalConsonante('f', 'r', 'n')
    addSilabaDosConsonantesVocalConsonante('g', 'l', 'n')
    addSilabaDosConsonantesVocalConsonante('g', 'r', 'n')
    addSilabaDosConsonantesVocalConsonante('p', 'l', 'n')
    addSilabaDosConsonantesVocalConsonante('p', 'r', 'n')
    addSilabaDosConsonantesVocalConsonante('t', 'l', 'n')
    addSilabaDosConsonantesVocalConsonante('t', 'r', 'n')

    addSilabaDosConsonantesVocalConsonante('b', 'l', 'r')

    addSilabaDosConsonantesVocalConsonante('b', 'l', 's')
    addSilabaDosConsonantesVocalConsonante('b', 'r', 's')
    addSilabaDosConsonantesVocalConsonante('c', 'h', 's')
    addSilabaDosConsonantesVocalConsonante('c', 'l', 's')
    addSilabaDosConsonantesVocalConsonante('c', 'r', 's')
    addSilabaDosConsonantesVocalConsonante('d', 'r', 's')
    addSilabaDosConsonantesVocalConsonante('f', 'l', 's')
    addSilabaDosConsonantesVocalConsonante('f', 'r', 's')
    addSilabaDosConsonantesVocalConsonante('g', 'l', 's')
    addSilabaDosConsonantesVocalConsonante('g', 'r', 's')
    addSilabaDosConsonantesVocalConsonante('p', 'l', 's')
    addSilabaDosConsonantesVocalConsonante('p', 'r', 's')
    addSilabaDosConsonantesVocalConsonante('t', 'l', 's')
    addSilabaDosConsonantesVocalConsonante('t', 'r', 's')

    //consonantes=['b', 'c', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'll', 'm', 'n', 'ñ', 'p', 'q', 'r', 's', 't', 'v', 'w', 'x', 'y', 'z']



    //Diptongos
    silabas.push('ai')
    silabas.push('au')
    silabas.push('ei')
    silabas.push('eu')
    silabas.push('ia')
    silabas.push('ie')
    silabas.push('io')
    silabas.push('oi')
    silabas.push('ou')
    silabas.push('ua')
    silabas.push('ue')
    silabas.push('uo')

    //Agregando silabas que comienzan con vocales y terminan en consonante
    silabas.push('ab')
    silabas.push('ac')
    silabas.push('ad')
    silabas.push('ag')
    silabas.push('al')
    silabas.push('am')
    silabas.push('an')
    silabas.push('ap')
    silabas.push('ar')
    silabas.push('as')
    silabas.push('el')
    silabas.push('em')
    silabas.push('en')
    silabas.push('ep')
    silabas.push('er')
    silabas.push('es')
    silabas.push('et')
    silabas.push('ex')
    silabas.push('im')
    silabas.push('in')
    silabas.push('ir')
    silabas.push('is')
    silabas.push('oc')
    silabas.push('of')
    silabas.push('ol')
    silabas.push('om')
    silabas.push('on')
    silabas.push('op')
    silabas.push('or')
    silabas.push('os')
    silabas.push('or')
    silabas.push('ul')
    silabas.push('um')
    silabas.push('un')
    silabas.push('ur')
    silabas.push('us')



    console.log('Cantidad de Silabas: '+silabas.length)
    for(var i=0; i<silabas.length;i++){

        var space='       '
        if(i>8&&i<100){
            space='     '
        }
        if(i>98){
            space='   '
        }
        //console.log(parseInt(i+1)+':'+space+silabas[i])
        //data+=parseInt(i+1)+':'+space+silabas[i]+'\n'
        if(unik.fileExist('./silabas_ajustadas/'+silabas[i])){
            var df=''+unik.getFile('./silabas_ajustadas/'+silabas[i])
            var dfm0=df.split(' ')
            //console.log('------->'+df)
            data+='"'+silabas[i]+'":['+dfm0[0]+','+dfm0[1]+']'
        }else{
            data+='"'+silabas[i]+'":[-1,-1]'
        }

        if(i!==silabas.length-1){
            data+=','
        }
        data+='\n'
    }
    jsonSil+='{\n'
    jsonSil+=data
    jsonSil+='}\n'
    //console.log(data)
    //unik.setFile('/home/nextsigner/jsonSil.json', jsonSil)
    unik.setFile('jsonSil.json', jsonSil)
}

setSil()
