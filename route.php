<?php
include_once 'app/controllers/product-controller.php';
include_once 'app/controllers/brand-controller.php';
include_once 'app/controllers/auth-controller.php';

define('BASE_URL', '//'.$_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . dirname($_SERVER['PHP_SELF']).'/');

$action = 'products'; 
if (!empty($_GET['action'])) {
    $action = $_GET['action'];
}

$params = explode('/', $action);

//Instancio el controller
$productController = new ProductController(); //Los instancio en la tabla de ruteo?? 
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
    case 'addproduct': // addproduct // add/product 
        $productController->add();
        break;
    case 'deleteproduct':
        $id = $params[1];
        $productController->delete($id);
        break;
    case 'editproductform':
        $id = $params[1];
        $productController->editView($id);
        break;
    case 'editproduct':
        $id = $params[1];
        $productController->edit($id);
        break;
    case 'productsbybrand':
        $id_brand = $params[1];
        $productController->showByBrand($id_brand);
        break;
    case 'brands':
        $brandController->showAll();
        break;
    case 'addbrand':
        $brandController->add();
        break;
    case 'deletebrand':
        $id = $params[1];
        $brandController->delete($id);
        break;
    case 'editbrandform':
        $id = $params[1];
        $brandController->editView($id);
        break;
    case 'editbrand':
        $id = $params[1];
        $brandController->edit($id);
        break;
    case 'inventoryform':
        $brandController->addInventory();
        break;
    default:
        echo('404 Page not found');
        header("HTTP/1.0 404 Not Found");
        break;
}
