{include file="templates/header.tpl"}

<h1  class="display-2 container text-center mt-3">Las marcas con las que trabajamos</h1>
<table class='table mt-5'>
    <thead>
        <tr>
            <th scope='col'>Marca</th>
            <th scope='col'>Industria</th>
            <th scope='col'>Categoria</th>
            <th scope='col'>Productos</th>
            {if isset($smarty.session.USER_ID)}
                <th scope='col'></th>
                <th scope='col'></th>
            {/if}
        </tr>
    </thead>
    <tbody>
        {foreach $brands as $brand}
            <tr>
                <td>{$brand->name}</td> 
                <td>{$brand->industry}</td>
                <td>{$brand->category}</td>
                <td>
                    <a href="productsbybrand/{$brand->id}" class="btn btn-secondary btn-sm">Ver productos</a>
                </td>
                {if isset($smarty.session.USER_ID)}
                    <td><a class="btn btn-danger" href="deletebrand/{$brand->id}">Borrar<a></td>
                    <td><a class="btn btn-info"  href="editbrandform/{$brand->id}">Editar<a></td>   
                {/if}    
            </tr>
        {/foreach}
   </tbody>
</table>

{include file="templates/footer.tpl"}
