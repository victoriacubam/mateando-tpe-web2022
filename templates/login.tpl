{include file="templates/header.tpl"}

<div class="mt-5 w-25 mx-auto">
    <h1 class="display-5">Iniciar sesion</h1>
    <form action='validate' method='POST'>
        <div class='mb-3'>
            <label for='exampleInputEmail1' class='form-label'>Email</label>
            <input type='email' class='form-control' id='email' name="email" aria-describedby='emailHelp' required>
        </div>
        <div class='mb-3'>
            <label for='exampleInputPassword1' class='form-label'>Password</label>
            <input type='password' class='form-control' id='password' name="password" required>
        </div>
        {if $error} 
            <div class="alert alert-danger mt-3">
                {$error}
            </div>
        {/if}
        <button type='submit' class='btn btn-primary'>Ingresar</button>
    </form>
</div>

{include file="templates/footer.tpl"}