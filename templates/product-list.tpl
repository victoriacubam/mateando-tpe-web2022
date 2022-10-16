{include file="templates/header.tpl"}

{if count($products)==0}
    <div class="container text-center">
        <h2 class="display-5 mt-5">No hay stock de productos para la marca seleccionada</h2>
        <a href="{BASE_URL}" class="btn btn-dark mt-4">Volver a la pagina principal</a>
    </div>   
{else}
    <h1 class="display-2 container text-center">Conoce nuestra variedad de productos</h1>
    <table class='table mt-5'>
        <thead>
            <tr>
                <th scope='col'></th>
                <th scope='col'>Producto</th>
                <th scope='col'>Marca</th>
                <th scope='col'>Precio</th>
                {if isset($smarty.session.USER_ID)}
                    <th scope='col'></th>
                    <th scope='col'></th>
                {/if}
            </tr>
        </thead>
        <tbody>
            {foreach $products as $product}
                <tr>
                    <td><a class="btn btn-success" href="product/{$product->id}">Ver mas<a></td>
                    <td>{$product->name}</td> 
                    <td>
                        {foreach $brands as $brand}
                            {if $product->id_brand == $brand->id}
                                {$brand->name}
                            {/if}
                        {/foreach}
                    </td>
                    <td><span>$</span>{$product->price}</td>
                    {if isset($smarty.session.USER_ID)}
                        <td><a class="btn btn-danger" href="deleteproduct/{$product->id}">Borrar<a></td>
                        <td><a class="btn btn-info" href="editproductform/{$product->id}">Editar<a></td>                           
                    {/if}
                </tr>
            {/foreach}

        </tbody>
    </table>
{/if}

{include file="templates/footer.tpl"}