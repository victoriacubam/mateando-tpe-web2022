<!DOCTYPE html>
<html lang="en">
<head>
    <base href="{BASE_URL}">

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <link rel="stylesheet" href="styles/style.css">
    <title>Mateando</title>
</head>

<body>
    <header>
      <nav class="navbar navbar-expand-lg bg-light">
        <div class="container-fluid">
        <img src="img/logo-mateando.png" alt="Logo">
          <a class="navbar-brand" href="products">Mateando</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link" aria-current="page" href="products">Productos</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="brands">Marcas</a>
              </li>
              {if isset($smarty.session.USER_ID)}
                <li class="nav-item">
                  <a class="nav-link" href="inventoryform">Añadir inventario</a>
                </li>
              {/if}
            </ul>
            <div class="d-flex" role="search">
              {if !isset($smarty.session.USER_ID)}
                <a class="btn btn-secondary" href="login">Ingresar</a>
              {else}
                <a class="btn btn-secondary" href="logout">Cerrar sesion ({$smarty.session.USER_EMAIL})</a>
              {/if}
            </div>
          </div>
        </div>
      </nav>
    </header>

    <main class="container">