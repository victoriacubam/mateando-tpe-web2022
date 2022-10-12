<?php

class ProductModel {

    private $db;

    //Abro la conexion con el constructor
    function __construct(){
        $this->db = $this->getDB();
    }

    //conexion a la bbdd
    private function getDB() {
        $db = new PDO('mysql:host=localhost;'.'dbname=db_tpe;charset=utf8', 'root', '');
        return $db;
    }

    //Traigo todos los productos de la bbdd
    function getAll() {
        // 2. ejecuto la sentencia (2 subpasos)
        $query = $this->db->prepare("SELECT * FROM products");
        $query->execute();

        // 3. obtengo los resultados
        $products = $query->fetchAll(PDO::FETCH_OBJ); // devuelve un arreglo de productos
        
        return $products;
    }

    function getProduct($id){
        $query = $this->db->prepare('SELECT * FROM products WHERE id = ?');
        $query->execute([$id]);
        $product = $query->fetch(PDO::FETCH_OBJ);
        return $product;
    }

    
    //Inserta un en la producto en la base de datos.
    function insert($name, $id_brand, $description, $price) {
        $query = $this->db->prepare("INSERT INTO products (name, id_brand, description, price) VALUES (?, ?, ?, ?)");
        $query->execute([$name, $id_brand, $description, $price]);

        return $this->db->lastInsertId();
    }

    //Elimina un producto dado su id.
 
    function deleteById($id) {
        $query = $this->db->prepare('DELETE FROM products WHERE id = ?');
        $query->execute([$id]);
    }

    function editById($name, $id_brand, $description, $price, $id){
        $query = $this->db->prepare('UPDATE `products` SET name = ? , id_brand = ? , description = ?, price = ? WHERE id = ?');
        $query->execute([$name, $id_brand, $description, $price, $id]);
    }

    // function get($id_brand) {
    //     // 2. ejecuto la sentencia (2 subpasos)
    //     $query = $this->db->prepare("SELECT a.*, b.* FROM products a INNER JOIN brands b ON a.id_brand = b.id WHERE id_brand = ?");
    //     $query->execute([$id_brand]);
    //     // 3. obtengo los resultados
    //     $products = $query->fetchAll(PDO::FETCH_OBJ); // devuelve un arreglo de productos
        
    //     return $products;
    // }

    function getByBrand($id_brand) {
        // 2. ejecuto la sentencia (2 subpasos)
        $query = $this->db->prepare("SELECT * FROM products WHERE id_brand = ?");
        $query->execute([$id_brand]);
        // 3. obtengo los resultados
        $products = $query->fetchAll(PDO::FETCH_OBJ); // devuelve un arreglo de productos
        
        return $products;
    }

    function getMore($id) {
        // 2. ejecuto la sentencia (2 subpasos)
        $query = $this->db->prepare("SELECT * FROM products WHERE id = ?");
        $query->execute([$id]);

        // 3. obtengo los resultados
        $product = $query->fetch(PDO::FETCH_OBJ); 
        
        return $product;
    }
    
}