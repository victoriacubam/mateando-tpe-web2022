{include file="templates/header.tpl"}

<h1 class="display-5 mt-5 text-center">Editar producto</h1>
<div class="row justify-content-md-center">
    <form action="editProduct/{$product->id}" method="POST" class="my-5" enctype="multipart/form-data">
        <div class="row">
            <div class="col-9">
                <div class="form-group">
                    <label>Producto</label>
                    <input name="name" type="text" class="form-control" value="{$product->name}" required>
                </div>
            </div>
            <div class="col-3">
                <div class="form-group">
                    <label>Marca</label>
                    <select name="id-brand" class="form-select">
                        <option disabled>Seleccionar</option>
                        {foreach $brands as $brand}
                            <option {if $brand->id == $product->id_brand}
                                selected
                            {/if} value="{$product->id_brand}">{$brand->name}</option>
                        {/foreach}
                    </select>
                </div>
            </div>
        </div>

        <div class="form-group">
            <label>Descripcion</label>
            <input name="description" class="form-control" rows="3" maxlength="200" required value="{$product->description}"></input>
        </div>

        <div class="form-group">
            <label>Precio</label>
            <div class="input-group mb-3">
                <span class="input-group-text">$</span>
                <input type="number" name="price" class="form-control" value="{$product->price}" >
            </div>
        </div>
        <div class="col-9">
            <div class="form-group">
                <label>Subir imagen ilustrativa</label>
                <input type="file" name="img" class="form-control" rows="3" required></input>
            </div>
        </div>
        <div class="d-grid gap-2 d-md-flex justify-content-md-center">
            <button type="submit" class="btn btn-primary mt-2">Editar producto</button>
        </div>
    </form>
</div>



{include file="templates/footer.tpl"}
