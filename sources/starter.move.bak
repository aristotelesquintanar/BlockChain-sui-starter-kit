module starter::practica_sui {
    use std::debug::print;
    use std::string::{String, utf8};

    public struct Usuario has drop{
        nombre : String,
        edad: u8,
        vivo: bool
    }


    /*fun practica() {
        print(&utf8(b"Hello, World!"));
        print(&123);
    }*/

    /*fun condicional()
    {
        let edad = 18;
        if( edad > 18 )
        {
            print( &utf8( b"Acceso permitido" ));
        }
        else if( edad == 18 )
        {
            print( &utf8( b"Acceso permitido" ));
        }
        else
        {
            print( &utf8( b"Acceso NO permitido" ));
        }
        
    }*/

    /*fun condicionalConParametro( edad: u8 )
    {
        //let edad = 18;
        if( edad > 18 )
        {
            print( &utf8( b"Acceso permitido" ));
        }
        else if( edad == 18 )
        {
            print( &utf8( b"Felicidades" ));
        }
        else
        {
            print( &utf8( b"Acceso NO permitido" ));
        }
        
    }*/

    fun parametroObjeto( u: Usuario )
    {
        //let edad = 18;
        if( u.edad > 18 )
        {
            print( &utf8( b"Acceso permitido" ));
        }
        else if( u.edad == 18 )
        {
            print( &utf8( b"Felicidades" ));
        }
        else
        {
            print( &utf8( b"Acceso NO permitido" ));
        }
        
    }

    #[test]
    fun prueba() {
        u = Usuario{
            nombre: &utf8( b"Aris" ),
            edad: 18,
            vivo: true
        };

        parametroObjeto( u );
    }
}