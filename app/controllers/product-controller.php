<?php
require_once 'app/models/product-model.php';
require_once 'app/views/product-view.php';
require_once 'app/models/brand-model.php';
require_once 'app/helpers/auth-helper.php';


class ProductController {

    private $model;
    private $view;
    private $modelBrands;

    function __construct(){
        $this->model = new ProductModel();
        $this->view = new ProductView();
        $this->modelBrands = new BrandModel();
        
        if (session_status() != PHP_SESSION_ACTIVE) {
            session_start();
        }  
    }

    // Funciones publicas -->

    function showAll(){
        $products = $this->model->getAll();

        $brands = $this->modelBrands->getAll();

        $this->view->showAll($products,$brands);
    }

    function showByBrand($id_brand){
        $products = $this->model->getByBrand($id_brand);
        $brands = $this->modelBrands->getAll();

        $this->view->showAll($products,$brands);
    }

    function showMore($id){
        $product = $this->model->getMore($id);
        $brand = $this->modelBrands->getBrand($product->id_brand);

        $this->view->showMore($product,$brand);
    }

    //Funciones del administrador -->

    function add() {
        $authHelper = new AuthHelper();
        $authHelper->checkLoggedIn();
        
        if((!empty($_POST['name'])&&!empty($_POST['id-brand'])&&!empty($_POST['description'])&&!empty($_POST['price']))
            &&(isset($_POST['name'])&&isset($_POST['id-brand'])&&isset($_POST['description'])&&isset($_POST['price']))){
            
            $name = $_POST['name'];
            $id_brand = $_POST['id-brand'];
            $description = $_POST['description'];
            $price = $_POST['price'];
            
            if (($_FILES['img']['type'] == "image/jpg" || $_FILES['img']['type'] == "image/jpeg" || $_FILES['img']['type'] == "image/png")){
                $id = $this->model->insert($name,$id_brand,$description,$price, $_FILES['img']['tmp_name']);
            } else {
                $id = $this->model->insert($name,$id_brand,$description,$price);
            }

            $this->view->success(true);

        } else {
            $this->view->success(false,"Faltan datos obligatorios");
            die();
        }  
    }

    function addInventory(){
        $authHelper = new AuthHelper();
        $authHelper->checkLoggedIn();
        
        $brands = $this->modelBrands->getAll();
        $this->view->addInventory($brands);
    }

    function delete($id) {
        $authHelper = new AuthHelper();
        $authHelper->checkLoggedIn();

        try {
            $this->model->deleteById($id);
            $this->view->success(true);
        } catch(Exception $e) {
            $this->view->success(false, "No fue posible eliminar el producto");
        }
    }

    function editView($id){
        $authHelper = new AuthHelper();
        $authHelper->checkLoggedIn();

        $brands = $this->modelBrands->getAll();

        $product = $this->model->getProduct($id);
        $this->view->editProduct($product, $brands);
    }
    
    function edit($id) {
        $authHelper = new AuthHelper();
        $authHelper->checkLoggedIn();

        if((isset($_POST['name']) && isset($_POST['id-brand']) && isset($_POST['description']) && isset($_POST['price']))
            && (!empty($_POST['name']) && !empty($_POST['id-brand']) && !empty($_POST['description']) && !empty($_POST['price']))){
            
            $name = $_POST['name'];
            $id_brand = $_POST['id-brand'];
            $description = $_POST['description'];
            $price = $_POST['price'];
            
            $this->model->editById($name, $id_brand, $description, $price, $id);
            $this->view->success(true);
            
        } else {
            $this->view->success(false, "Faltan datos obligatorios");
            die();
        }
    }

}