![banner](./imagenes/banner.jpg)

# Sui Starter Kit - Sistema de Gestión de Inventario

## 📋 Descripción del Proyecto

Este es un pequeño proyecto basado en **Sui Starter Kit** que implementa un sistema de gestión de inventario (MiniPOS) desarrollado en **Move**.  Usacontratos inteligentes en la blockchain Sui. El proyecto incluye múltiples ejemplos y módulos que demuestran las capacidades fundamentales de desarrollo en Sui.

## 🏗️ Arquitectura del Proyecto

### Estructura de Archivos
```
BlockChain-sui-starter-kit/
├── .devcontainer/          # Configuración de desarrollo (por lo que entendí)
│   ├── devcontainer.json   # Configuración del contenedor (aunque no le entendí del todo)
│   └── setup.sh            # Script de instalación automática (aunque no le entendí del todo)
├── imagenes/               # Recursos gráficos (venían, realmente solo los usa el README(original).md)
│   ├── banner.jpg
│   ├── codespaces.png
│   └── fork.png
├── sources/                # Código fuente Move
│   ├── starter.move        # Módulo principal - Sistema MiniPOS
│   ├── starter.move.bak    # Backup - Ejemplos iniciales de práctica
│   └── starter.move.bak2   # Backup - Sistema de biblioteca visto en clases
├── Move.toml               # Configuración del paquete Move (aún no le entiendo bien)
└── README(original).md     # README.md original con instrucciones
└── README.md               # Este archivo
```

## 🚀 Funcionalidades Implementadas

### 1. Sistema MiniPOS (Módulo Principal)
El archivo `starter.move` contiene un sistema completo de gestión de inventario con las siguientes características:

#### Estructuras de Datos
- **`Articulo`**: Representa un producto con código, descripción, precio y estado activo
- **`Almacen`**: Contenedor principal que almacena artículos usando VecMap

#### Funciones Principales
- ✅ `crear_almacen()` - Crear un nuevo almacén
- ✅ `eliminar_almacen()` - Eliminar un almacén existente
- ✅ `agregar_articulo()` - Añadir productos al inventario
- ✅ `actualizar_disponibilidad_articulo()` - Activar/desactivar productos
- ✅ `actualizar_precio_articulo()` - Modificar precios
- ✅ `actualizar_articulo()` - Actualizar todos los datos de un producto
- ✅ `eliminar_articulo()` - Remover productos del inventario

#### Manejo de Errores
- Validación de IDs únicos para artículos
- Verificación de existencia antes de operaciones
- Mensajes de error personalizados

### 2. Módulo de Práctica (starter.move.bak)
Incluye ejemplos educativos de:
- Estructuras de datos básicas (`Usuario`)
- Funciones con parámetros
- Lógica condicional
- Tests unitarios

### 3. Sistema de Biblioteca (starter.move.bak2)
Implementación alternativa que demuestra:
- Gestión de libros con título, autor y año de publicación
- Control de disponibilidad
- Operaciones CRUD completas

## 🛠️ Tecnologías Utilizadas

### Blockchain y Contratos Inteligentes
- **Sui Blockchain**: Plataforma de capa 1 para activos digitales
- **Move Language**: Lenguaje de programación para contratos seguros
- **Sui CLI**: Herramientas de línea de comandos

### Herramientas de Desarrollo
- **VS Code Extensions**:
  - Move Language Support
  - Move Formatter (Prettier)

### Entorno de Desarrollo
- **GitHub Codespaces**: Desarrollo en la nube

## 🚀 Configuración y Uso

### Opción 1: GitHub Codespaces (Recomendado)
1. **Fork** este repositorio a tu cuenta
2. Haz clic en **`<> Code`** → **`Codespaces`**
3. Selecciona **`Create codespace on master`**
4. El entorno se configurará automáticamente

### Opción 2: Desarrollo Local
1. Instala SuiUp:
```bash
curl -sSfL https://raw.githubusercontent.com/Mystenlabs/suiup/main/install.sh | sh
```

2. Instala Sui CLI:
```bash
suiup install sui -y
```

3. Instala las extensiones de VS Code:
   - `mysten.move`
   - `mysten.prettier-move`

## 🧪 Ejecución y Pruebas

### Ejecutar Tests
```bash
sui move test
```

### Compilar el Proyecto
```bash
sui move build
```

### Desplegar en Testnet
```bash
sui client publish
```

## 📚 Conceptos de Move Demostrados

### Estructuras de Datos
- **`struct`**: Definición de tipos personalizados
- **`has`**: Capacidades de los tipos (store, drop, key)
- **`UID`**: Identificador único de objetos en Sui

### Funciones y Módulos
- **`module`**: Organización del código
- **`public fun`**: Funciones accesibles externamente
- **`#[test]`**: Funciones de prueba

### Manejo de Memoria
- **`transfer::transfer()`**: Transferencia de propiedad
- **`object::new()`**: Creación de nuevos objetos
- **`id.delete()`**: Liberación de memoria

### Colecciones
- **`VecMap`**: Mapa vectorial para almacenamiento eficiente
- **`vec_map::empty()`**: Inicialización de colecciones

## 🔧 Configuración del Proyecto

### Move.toml
```toml
[package]
name = "Intro"
version = "0.0.1"
edition = "2024.beta"

[addresses]
starter = "0x0"

[dependencies]
# Sin dependencias externas - usa solo las librerías estándar
```

## 🎯 Casos de Uso

Este proyecto es ideal para:
- **Aprendizaje**: Entender conceptos básicos de Move y Sui
- **Prototipado**: Base para sistemas de inventario más complejos
- **Educación**: Ejemplos prácticos de desarrollo blockchain
- **Desarrollo**: Punto de partida para aplicaciones DeFi o NFT

## 🔄 Evolución del Proyecto

El proyecto muestra la evolución del desarrollo:
1. **starter.move.bak**: Ejemplos básicos y práctica
2. **starter.move.bak2**: Sistema de biblioteca
3. **starter.move**: Sistema MiniPOS completo y funcional

## 📖 Recursos Adicionales

- [SUI GitBook](https://waylearn.gitbook.io)
- [Documentación Oficial de Sui](https://docs.sui.io/)
- [Guía de Move](https://move-language.github.io/move/)
- [Sui CLI Reference](https://docs.sui.io/references/cli/client)
- [MystenLabs GitHub](https://github.com/Mystenlabs)