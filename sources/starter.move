module starter ::biblioteca {
    use std::string::{String, utf8};
    use sui::vec_map::{VecMap, Self};

    #[error]
    const ID_YA_EXISTE: vector<u8> = b"El ID del libro ya existe en la biblioteca";

    public struct Biblioteca has key
    {
        id: UID,
        nombre: String,
        libros: VecMap<u64, Libro>,
    }

    // Define un tipo simple
    public struct Libro has store {
        titulo: String,
        autor: String,
        publicacion: u16,
        disponible: bool
    }

    // Función para crear una instancia de Biblioteca
    public fun crear_biblioteca( ctx: &mut TxContext ){

        let biblioteca = Biblioteca {
        id: object::new(ctx),
        nombre: utf8(b"Mi Biblioteca"),
        libros: vec_map::empty(),
        };
        
        transfer::transfer( biblioteca, tx_context::sender(ctx) );
    }

    public fun agregar_libro( biblioteca: &mut Biblioteca, id: u64, titulo: String, autor: String, publicacion: u16 ){

        assert!(!biblioteca.libros.contains( &id), ID_YA_EXISTE);

        let libro = Libro { 
            titulo, // es lo mismo que escribir: titulo: titulo, 
            autor,
            publicacion,
            disponible: true
        };

        biblioteca.libros.insert(id, libro);
    }
}