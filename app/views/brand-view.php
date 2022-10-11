<?php
require_once './libs/smarty-4.2.1/libs/Smarty.class.php';

class BrandView {
    private $smarty;

    public function __construct() {
        $this->smarty = new Smarty();
    }

    function showAll($brands){
        $this->smarty->assign("brands", $brands);
        $this->smarty->display('brand-list.tpl');
    }

    function success($success, $msg = null){
        $this->smarty->assign("success", $success);
        if (!empty($msg)) {
            $this->smarty->assign("msg", $msg);
        }
        $this->smarty->display('success.tpl');
    }

    function addInventory($brands){
        $this->smarty->assign("brands", $brands);
        $this->smarty->display('inventory-form.tpl');
    }

    function editBrand($brand){
        $this->smarty->assign("brand", $brand);
        $this->smarty->display('edit-brand.tpl');
    }

}