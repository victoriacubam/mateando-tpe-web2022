{include file="templates/header.tpl"}

<div class="row justify-content-md-center container text-center mt-5">
    <div class="card">
        <div class="card-body">
            <h5 class="card-title display-4">{$product->name}</h5>
            <h6 class="card-subtitle mb-2 text-muted display-6">{$brand->name}</h6>
            <p class="card-text lead">{$product->description}</p>
            <p class="card-text lead"><span>Precio $</span>{$product->price}</p>
            <a class="btn btn-primary mt-2" href="{BASE_URL}">Volver</a>
        </div>
    </div>
</div>

{include file="templates/footer.tpl"}