{include file="templates/header.tpl"}

<div class="row justify-content-md-center container text-center mt-5 mb-5" >
    <div class="card" id="cardProduct">
        {if isset($product->img)}
            <div><img src="{$product->img}"> </div>
        {/if}
        <hr>
        <div class="card-body">
            <h5 class="card-title display-6">{$product->name}</h5>
            
            <h6 class="card-subtitle mb-2 text-muted">{$brand->name}</h6>
            <p class="card-text">{$product->description}</p>
            <p class="card-text lead"><span>Precio $</span>{$product->price}</p>
            {if isset($smarty.session.USER_ID)}
                <a class="btn btn-danger mt-2" href="deleteProduct/{$product->id}">Borrar<a>
                <a class="btn btn-info mt-2" href="editProductForm/{$product->id}">Editar<a>                          
            {/if}
            <a class="btn btn-primary mt-2" href="{BASE_URL}">Volver</a>
        </div>
    </div>
</div>

{include file="templates/footer.tpl"}