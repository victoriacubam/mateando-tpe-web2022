{include file="templates/header.tpl"}

<h1 class="display-5 mt-5 text-center">Editar marca</h1>
<div class="row justify-content-md-center">
    <form action="editBrand/{$brand->id}" method="POST" class="my-4">
        <div class="row justify-content-md-center">
            <div class="col-9">
                <div class="form-group">
                    <label>Marca</label>
                    <input name="name" type="text" class="form-control" value="{$brand->name}" required>
                </div>
            </div>
            <div class="col-9">
                <div class="form-group">
                    <label>Industria</label>
                    <input name="industry" type="text" class="form-control" value="{$brand->industry}" required>
                </div>
            </div>
            <div class="col-9">
                <div class="form-group">
                    <label>Categoria</label>
                    <input name="category" type="text" class="form-control" value="{$brand->category}" required>
                </div>
            </div>
        </div>
        <div class="d-grid gap-2 d-md-flex justify-content-md-center">
            <button type="submit" class="btn btn-primary mt-2">Editar marca</button>
        </div>
    </form>  
</div>     
 
{include file="templates/footer.tpl"}
