<?php

class BrandModel {
    private $db;

    //1. Abro la conexion con el constructor
    function __construct(){
        $this->db = $this->getDB();
    }

    //Abro la conexion a la bbdd
    private function getDB() {
        $db = new PDO('mysql:host=localhost;'.'dbname=db_tpe;charset=utf8', 'root', '');
        return $db;
    }

    //Traigo todos los productos de la bbdd
    function getAll() {
        // 2. ejecuto la sentencia (2 subpasos)
        $query = $this->db->prepare("SELECT * FROM brands");
        $query->execute();

        // 3. obtengo los resultados
        $brands = $query->fetchAll(PDO::FETCH_OBJ); // devuelve un arreglo de productos
        
        return $brands;
    }

    function getBrand($id){
        $query = $this->db->prepare('SELECT * FROM brands WHERE id = ?');
        $query->execute([$id]);
        $brand = $query->fetch(PDO::FETCH_OBJ);
        
        return $brand;
    }

    function insert($name, $industry, $category) {
        $query = $this->db->prepare("INSERT INTO brands (name, industry, category) VALUES (?, ?, ?)");
        $query->execute([$name, $industry, $category]);

        return $this->db->lastInsertId();
    }
 
    function deleteById($id) {
        $query = $this->db->prepare('DELETE FROM brands WHERE id = ?');
        $query->execute([$id]);
    }

    function editById($name, $industry, $category, $id){
        $query = $this->db->prepare('UPDATE `brands` SET name = ? , industry = ? , category = ? WHERE id = ?');
        $query->execute([$name, $industry, $category, $id]);
    }

}