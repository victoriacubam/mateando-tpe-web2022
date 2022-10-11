{include file="templates/header.tpl"}

{if $success}
    <div class="alert alert-success container text-center " role="alert">
        <h4 class="alert-heading">Acción exitosa</h4>
        <hr>
        <a href="{BASE_URL}" class="btn btn-light">Volver a la pagina principal</a>
    </div> 
{else}
    <div class="alert alert-danger container text-center " role="alert">
        <h4 class="alert-heading">Error</h4>
        <p>{$msg}</p>
        <hr>
        <a href="{BASE_URL}" class="btn btn-light">Volver a la pagina principal</a>
    </div> 
{/if}
  
{include file="templates/footer.tpl"}