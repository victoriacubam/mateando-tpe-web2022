<?php
require_once './app/views/auth-view.php';
require_once './app/models/user-model.php';


class AuthController {
    private $view;
    private $model;
    
    public function __construct() {
        $this->model = new UserModel();
        $this->view = new AuthView();
    }

    public function showLogin() {
        $this->view->showLogin();
    }

    public function validateUser() {
        
        // Valido que email y pass esten seteados y no esten vacios
        
        if ((isset($_POST['email'])&&!empty($_POST['email']))&&(isset($_POST['password'])&&!empty($_POST['password']))){
            
            $email = $_POST['email'];
            $password = $_POST['password'];

            $user = $this->model->getUserByEmail($email);

            if ($user && password_verify($password, $user->password)) {

                // inicio una session para este usuario
                session_start();
                $_SESSION['USER_ID'] = $user->id;
                $_SESSION['USER_EMAIL'] = $user->email;
                $_SESSION['IS_LOGGED'] = true;

                header("Location: " . BASE_URL);
                
            } else {
                // si los datos son incorrectos le mando al login el parametro de error
                $this->view->showLogin("El usuario o la contraseña son incorrectos.");
            } 
        }
        else {
            $this->view->showLogin("Faltan datos obligatorios");
            die();
        }
    }

    public function logout() {
        session_start();
        session_destroy();
        header("Location: " . BASE_URL);
    }
}