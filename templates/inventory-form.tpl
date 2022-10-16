{include file="templates/header.tpl"}

<h1 class="display-4 mt-4 text-center">Formularios de alta</h1>

{* form alta de productos *}
<div class="row">

  <div class="col-sm-6 mt-5 mb-5">
    <h1 class="display-5 text-center">Productos</h1>
    <div class="card">
      <div class="card-body" id="inventory-product"> 
        <form action="addproduct" method="POST" class="my-4" enctype="multipart/form-data">
            <div class="row">
                <div class="col-9">
                    <div class="form-group">
                        <label>Producto</label>
                        <input name="name" type="text" class="form-control" >
                    </div>
                </div>
                <div class="col-3">
                    <div class="form-group">
                        <label>Marca</label>
                        <select name="id-brand" class="form-select">
                            <option selected disabled>Seleccionar</option>
                            {foreach $brands as $brand}
                                <option value="{$brand->id}">{$brand->name}</option>
                            {/foreach}
                        </select>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label>Descripcion</label>
                <input name="description" class="form-control" rows="3" maxlength="200" ></input>
            </div>

            <div class="form-group">
                <label>Precio</label>
                <div class="input-group mb-3">
                    <span class="input-group-text">$</span>
                    <input type="number" name="price" class="form-control" >
                </div>
            </div>
            <div class="form-group">
                <label>Subir imagen ilustrativa</label>
                <input type="file" name="img" class="form-control" id=imageToUpload rows="3" required></input>
            </div>
            <div class="d-grid gap-2 d-md-flex justify-content-md-center">
                <button type="submit" class="btn btn-primary mt-2">Añadir producto</button>
            </div>
        </form>
      </div>
    </div>
  </div>

  {* form alta de marcas *}
  <div class="col-sm-6 mt-5">
    <h1 class="display-5 text-center">Marcas</h1>
    <div class="card">
      <div class="card-body" id="inventory-brand">
        <form action="addbrand" method="POST" class="my-4">
            <div class="form-group">
                <label>Marca</label>
                <input name="name" type="text" class="form-control" >
            </div>
            <div class="form-group">
                <label>Industria</label>
                <input name="industry" type="text" class="form-control" >
            </div>
            <div class="form-group">
                <label>Categoria</label>
                <input name="category" type="text" class="form-control" >
            </div>
            <div class="d-grid gap-2 d-md-flex justify-content-md-center">
                <button type="submit" class="btn btn-primary mt-4">Añadir marca</button>
            </div>
        </form>        
      </div>
    </div>
  </div>
</div>

{include file="templates/footer.tpl"}
