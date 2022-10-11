<?php
include_once 'app/controllers/product-controller.php';
include_once 'app/controllers/brand-controller.php';
include_once 'app/controllers/auth-controller.php';

define('BASE_URL', '//'.$_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']).'/');

$action = 'products'; //por defecto
if (!empty($_GET['action'])) {
    $action = $_GET['action'];
}

// parsea la accion Ej: dev/juan --> ['dev', juan]
$params = explode('/', $action);

//Instancio el controller
$productController = new ProductController(); //Los instancio en la tabla de ruteo?? !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
$brandController = new BrandController();
$authController = new AuthController();

// tabla de ruteo
switch ($params[0]) {
    case 'login':
        $authController->showLogin();
        break;
    case 'validate':
        $authController->validateUser();
        break;
    case 'logout':
        $authController->logout();
        break;
    case 'products':
        $productController->showAll();
        break;
    case 'product':
        $id = $params[1];
        $productController->showMore($id);
        break;
    case 'addProduct':
        $productController->add();
        break;
    case 'deleteProduct':
        $id = $params[1];
        $productController->delete($id);
        break;
    case 'editProductForm':
        $id = $params[1];
        $productController->editView($id);
        break;
    case 'editProduct':
        $id = $params[1];
        $productController->edit($id);
        break;
    case 'productsByBrand':
        $id_brand = $params[1];
        $productController->showByBrand($id_brand);
        break;
    case 'brands':
        $brandController->showAll();
        break;
    case 'addBrand':
        $brandController->add();
        break;
    case 'deleteBrand':
        $id = $params[1];
        $brandController->delete($id);
        break;
    case 'editBrandForm':
        $id = $params[1];
        $brandController->editView($id);
        break;
    case 'editBrand':
        $id = $params[1];
        $brandController->edit($id);
        break;
    case 'inventoryForm':
        $brandController->addInventory();
        break;
    default:
        echo('404 Page not found');
        header("HTTP/1.0 404 Not Found");
        break;
}
