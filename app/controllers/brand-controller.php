<?php
require_once 'app/models/brand-model.php';
require_once 'app/views/brand-view.php';

class BrandController{

    private $model;
    private $view;

    function __construct(){
        $this->model = new BrandModel();
        $this->view = new BrandView();

        if (session_status() != PHP_SESSION_ACTIVE) {
            session_start();
        }  
    }
    
    // Funciones publicas -->

    function showAll(){
        $brands = $this->model->getAll();

        $this->view->showAll($brands);
    }

    // Funciones del administrador -->

    function add() {
        $authHelper = new AuthHelper();
        $authHelper->checkLoggedIn();
        if((isset($_POST['name'])&&isset($_POST['industry'])&&isset($_POST['category']))
            &&(!empty($_POST['name'])&&!empty($_POST['industry'])&&!empty($_POST['category']))){
            
            $name = $_POST['name'];
            $industry = $_POST['industry'];
            $category = $_POST['category'];
            
            $this->model->insert($name,$industry,$category);
            
            $this->view->success(true);
        } else {
            $this->view->success(false,"Faltan datos obligatorios");
        }
    }

    function delete($id) {
        $authHelper = new AuthHelper();
        $authHelper->checkLoggedIn();
        
        try {
            $this->model->deleteById($id);
            $this->view->success(true);

        } catch(Exception $e) {
            $this->view->success(false, "Modificacion sin éxito. No es posible eliminar una marca que cuenta con stock de productos. Borre previamente los productos asociados.");
        }
    }

    function addInventory(){
        $authHelper = new AuthHelper();
        $authHelper->checkLoggedIn();

        $brands = $this->model->getAll();
        $this->view->addInventory($brands);
    }

    function editView($id){
        $authHelper = new AuthHelper();
        $authHelper->checkLoggedIn();

        $brand = $this->model->getBrand($id);
        $this->view->editBrand($brand);
    }

    function edit($id){
        $authHelper = new AuthHelper();
        $authHelper->checkLoggedIn();

        if((isset($_POST['name'])&&isset($_POST['industry'])&&isset($_POST['category']))
            &&(!empty($_POST['name'])&&!empty($_POST['industry'])&&!empty($_POST['category']))){
        
            $name = $_POST['name'];
            $industry = $_POST['industry'];
            $category = $_POST['category'];
            
            $brands = $this->model->editById($name,$industry,$category,$id);
            
            $this->view->success(true);
        
        } else {
                $this->view->success(false, "Faltan datos obligatorios");
                die();
        }
    }
}