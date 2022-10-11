<?php
require_once 'app/models/user-model.php';
require_once 'app/views/user-view.php';

class UserController {

    private $model;
    private $view;

    function __construct(){
        $this->model = new UserModel();
        $this->view = new UserView();
    }

    function logIn(){
        $this->view->logIn();
    }

    function admin(){
        $this->view->admin();
    }
    
}