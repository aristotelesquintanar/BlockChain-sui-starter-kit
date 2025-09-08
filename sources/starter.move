module starter ::minipos
{
    use std::string::{ String/*, utf8*/ };
    use sui::vec_map::{ VecMap, Self };

    #[error]
    const ID_ARTICULO_YA_EXISTE: vector<u8> = b"El ID del articulo ya existe en el almacen";
    #[error]
    const ID_ARTICULO_NO_EXISTE: vector<u8> = b"El ID del articulo NO existe en el almacen";

    // Define la estructura del artículo que se comprará y venderá
    public struct Articulo has store, drop
    {
        codigo: String,
        descripcion: String,
        precio: u32,
        activo: bool
    }

    // Define la estructura del almacén que contendrá los artículos
    public struct Almacen has key
    {
        id: UID,
        nombre: String,
        articulos: VecMap< u64, Articulo >
    }

    // Función para crear un nuevo almacén
    public fun crear_almacen( nombre: String, ctx: &mut TxContext )
    {
        let almacen = Almacen
        {
            id: object::new(ctx),
            nombre, //nombre: utf8(b"Almacen Central"),
            articulos: vec_map::empty(),
        };

        transfer::transfer( almacen, tx_context::sender(ctx) );
    }

    // Función para eliminar el almacén
    public fun eliminar_almacen( almacen: Almacen )
    {
        let Almacen { id, nombre: _, articulos: _ } = almacen;
        id.delete();
    }

    // Función para agregar un nuevo artículo al almacén
    public fun agregar_articulo( almacen: &mut Almacen, id: u64, codigo: String, descripcion: String, precio: u32 )
    {
        assert!( !almacen.articulos.contains( &id ), ID_ARTICULO_YA_EXISTE );

        let articulo = Articulo { 
            codigo,
            descripcion,
            precio,
            activo: true
        };
        almacen.articulos.insert(id, articulo);
    }

    // Función para bloquear/desbloquear un artículo en el almacén
    public fun actualizar_disponibilidad_articulo( almacen: &mut Almacen, id: u64 )
    {
        assert!( almacen.articulos.contains( &id ), ID_ARTICULO_NO_EXISTE );
        let articulo = almacen.articulos.get_mut( &id );
        articulo.activo = !articulo.activo;
    }

    // Función para actualizar el precio de un artículo en el almacén
    public fun actualizar_precio_articulo( almacen: &mut Almacen, id: u64, nuevo_precio: u32 )
    {
        assert!( almacen.articulos.contains( &id ), ID_ARTICULO_NO_EXISTE );
        let articulo = almacen.articulos.get_mut( &id );
        articulo.precio = nuevo_precio;
    }

    // Función para actualizar todos los datos del artículo en el almacén
    public fun actualizar_articulo( almacen: &mut Almacen, id: u64, codigo: String, descripcion: String, precio: u32 )
    {
        assert!( almacen.articulos.contains( &id ), ID_ARTICULO_NO_EXISTE );
        let articulo = almacen.articulos.get_mut( &id );
        articulo.codigo = codigo;
        articulo.descripcion = descripcion;
        articulo.precio = precio;
    }

    // Función para eliminar un artículo del almacén
    public fun eliminar_articulo( almacen: &mut Almacen, id: u64 )
    {
        assert!( almacen.articulos.contains( &id ), ID_ARTICULO_NO_EXISTE );
        almacen.articulos.remove( &id );
    }
}