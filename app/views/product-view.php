<?php
require_once './libs/smarty-4.2.1/libs/Smarty.class.php';

class ProductView {
    private $smarty;

    public function __construct() {
        $this->smarty = new Smarty();
    }

    function showAll($products,$brands){
        $this->smarty->assign("products", $products);
        $this->smarty->assign("brands",$brands);
        $this->smarty->display('product-list.tpl');
    }

    function show($products){
        $this->smarty->assign("products", $products);
        
        $this->smarty->display('product-list.tpl');
    }

    function showMore($product,$brand){
        $this->smarty->assign("product", $product);
        $this->smarty->assign("brand", $brand);
        $this->smarty->display('about-product.tpl');
    }


    function success($success, $msg = null){
        $this->smarty->assign("success", $success);
        if (!empty($msg)) {
            $this->smarty->assign("msg", $msg);
        }
        $this->smarty->display('success.tpl');
    }

    function editProduct($product,$brands){
        $this->smarty->assign("product", $product);
        $this->smarty->assign("brands", $brands);
        $this->smarty->display('edit-product.tpl');
    }
}