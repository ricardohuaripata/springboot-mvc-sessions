
BEGIN;

drop database if exists tiendavirtual;

create database tiendavirtual;

use tiendavirtual;

create table users(
id int PRIMARY KEY AUTO_INCREMENT,
username varchar(250) not null,
password varchar(250) not null,
name varchar(250) not null,
lastname varchar(250) not null,
birthdate date not null,
isAdmin boolean not null
);

insert into users(username,password,name,lastname,birthdate,isAdmin) 
values('ricardohuaripata','ricardohuaripata','RICARDO','HUARIPATA','2002-05-18',1);

create table products(

    id int PRIMARY KEY AUTO_INCREMENT,
    tittle varchar(250) not null,
    description varchar(250) not null,
    price decimal(18,2) not null,
    imageLink varchar(1000) not null
);

insert into products(tittle, description, price, imageLink)
values('Realme Buds Air 3 Neo', 'Auriculares Inalambricos, Controlador dinámico de Graves de 10 mm, Dolby Atmos Calidad de Sonido Superior, Cancelación de Ruido ENC con IA,Resistencia al Agua IPX5',29.99,'https://m.media-amazon.com/images/I/51Fi0gfNoeL._AC_SL1500_.jpg'),('TOZO T10', 'Auriculares Bluetooth IPX8 Impermeable Bluetooth 5.3 In Ear inalámbricos con Estuche de Carga y micrófono, Sonido Premium con Graves Profundos para Correr y Hacer Deporte',32.99,'https://m.media-amazon.com/images/I/61NknmwhtXL._AC_SL1500_.jpg'),('JBL TUNE 230NC TWS', 'Auriculares inalámbricos In Ear True Wireless Bluetooth IPX4 con micrófono incorporado para música, deportes y llamadas, hasta 40h de batería',79.99,'https://m.media-amazon.com/images/I/61nan8OOchL._AC_SL1500_.jpg'),('Xiaomi Redmi Buds 3 Lite', 'Seguro y cómodo | Duración de la batería hasta 18 horas | Conexión simplificada al dispositivo | Bluetooth 5.2 | Calidad de sonido superior | Tecnología IP54 y resistencia al agua y al polvo',19.99,'https://m.media-amazon.com/images/I/51nuFLJDCvL._AC_SL1500_.jpg'),('HUAWEI FreeBuds SE Semi-In-Ear', 'Auriculares Bluetooth 5.2 inalámbricos, Cómodos de Llevar, Diseño Premium, Sonido, 24 Horas de batería, Cancelación de Ruido en Llamadas por 2 micrófonos, Blanco',39.99,'https://m.media-amazon.com/images/I/41kvcHkVwsL._AC_SL1200_.jpg'),('Jabra Elite 3', 'Auriculares inalámbricos con aislamiento de ruido, Bluetooth, 4 micrófonos integrados para un sonido personalizable y modo mono, Gris Oscuro',49.99,'https://m.media-amazon.com/images/I/51dxQxlMy+L._AC_SL1400_.jpg');

create table pedidos (
	id int PRIMARY KEY AUTO_INCREMENT,
    idUsuario int not null,
    direccion varchar(1000) not null,
	municipio varchar(250) not null,
    provincia varchar(250) not null,
    codigopostal varchar(5) not null,
    telefono varchar(15) not null,
	fecha datetime not null,
	total decimal(18,2) not null,
	CONSTRAINT fkUsuarioPedido FOREIGN KEY(idUsuario) REFERENCES users(id)
);

create table detalle_pedido(
	id int PRIMARY KEY AUTO_INCREMENT,
    idPedido int not null,
    idProducto int not null,
    cantidad int not null,
	CONSTRAINT fkDetallePedido FOREIGN KEY(idPedido) REFERENCES pedidos(id),
    CONSTRAINT fkProductoPedido FOREIGN KEY(idProducto) REFERENCES products(id)
);

COMMIT;