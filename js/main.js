$(function() {
    // Elementos capturados
    var modoNocturno = $('#btnmodonocturno');
    
    // MODO NOCTURNO

    var theme = "a";
    if(localStorage.getItem('theme') !== null) {
        theme = localStorage.getItem('theme');
        changeTheme(theme);
    }

    modoNocturno.click(function() {
        if(theme == "a") {
            theme = "b";
        } else {
            theme = "a";
        }
        localStorage.setItem('theme', theme);

        changeTheme(theme);
    });

    function changeTheme(theme) {
        $( "[data-role=page]" ).removeClass( "ui-page-theme-a ui-page-theme-b" ).addClass( "ui-page-theme-" + theme );
        $( ".ui-body-a, .ui-body-b" ).removeClass( "ui-body-a ui-body-b" ).addClass( "ui-body-" + theme );
        $( ".ui-bar-a, .ui-bar-b" ).removeClass( "ui-bar-a ui-bar-b" ).addClass( "ui-bar-" + theme );
        $( ".ui-panel-a, .ui-panel-b" ).removeClass( "ui-panel-a ui-panel-b" ).addClass( "ui-panel-" + theme );
    }
    
    // Cargar datos  

   // Mostrar itinerarios. (Lo puse dentro del "pagebeforeshow" porque antes al agregar un itinerario nuevo me mostraba el número de los id en vez del contenido. Recién al actualizar la página se mostraban bien. 
   //y ahora si al redireccionar a #itinerario se vuelve a cargar sola la lista mostrando el contenido en vez de los id. Me lo recomendó un chico de la mañana jaja)
   $(document).on('pagebeforeshow', '#animes', function(){     
        $.ajax({
            url: 'api/traer-animes.php',
            type: 'GET',
            success: function (anime) {
                crearLista(Array.from(anime));
            }
        })
    })

    $("#animes ul[data-role='listview']").on('click', 'button[data-anime]', function() {

        let button = $(this);
        $.ajax({
            url:"api/traer-anime-datos.php",
            type: 'POST',
            data: `id=${button.attr('data-anime')}`,
            success:function (anime){
                console.clear();
                console.log(anime[0]);
                $("#anime-title-header").html(anime[0].data.ANIME.toUpperCase());
                $("#anime-content-banner").attr("src",`imgs/${anime[0].data.BANNER}.jpg`);
                $("#anime-content-title").html(anime[0].data.ANIME.toUpperCase());
                $("#anime-content-sinopsis").html(anime[0].data.SINOPSIS);
                $("#anime-content-state").html(anime[0].data.ESTADO);
                $("#anime-content-caps").html(anime[0].data.CAPITULOS);
                $("#anime-content-state").html(anime[0].data.ESTADO);
                var generos = '';
                anime[0].generos.forEach(element => {
                    generos += ` <button data-genero="${element.genero_id}" class="botones-anime">${element.genero_name}</button>`
                });
                $("#anime-content-genres").html(generos);
                $("#anime-content-coments").attr("data-anime",anime[0].data.ID);

                var comentarios = '';
                anime[0].comentarios.forEach(element => {
                    comentarios += `
                    <li class="ui-btn ui-btn-icon-right ui-icon-delete">
                    <h2>${element.asunto}</h2>
                    <p><strong>CAPITULO ${element.capitulo} - CALIFICACIÓN ${element.nota}</strong></p>
                    <p>${element.texto}</p>
                    </li>                
                    `
                });
                $("#anime-content-list-coments").html(comentarios)
                location.href = "#anime";
            }
        })
    });

    // Formulario para crear comentarios

    var formularioDeComentarios = document.forms["form-nuevo-comentario"];
    $(formularioDeComentarios).on('submit',function(e){
        e.preventDefault();
        var asunto = formularioDeComentarios.elements["atencion"];
        var capitulo = formularioDeComentarios.elements["cantidad"];
        var nota = formularioDeComentarios.elements["calificacion"];
        var texto = formularioDeComentarios.elements["comentarios"];
        var anime = formularioDeComentarios.elements["anime"];
        $.ajax({
            url:"api/grabar-comentario.php",
            type: 'POST',
            data: `asunto=${asunto.value}&capitulo=${capitulo.value}&nota=${nota.value}&texto=${texto.value}`,
            success:function (rta){
                console.log("comentario",rta.success);
                if(rta.success){
                    $.ajax({
                        url:"api/grabar-anime-comentario.php",
                        type: 'POST',
                        data: `anime=${anime.value}&comentario=${rta.metadata}`,
                        success:function (rta){
                            if(rta.success){
                                $.confirm({
                                    title: 'Éxito!',
                                    content: `${rta.msg}`,
                                    type: 'green',
                                    escapeKey: 'quedarme',
                                    buttons: {
                                        quedarme: {
                                            text: 'Seguir cargando',
                                            action: function() {
                                                formularioDeComentarios.reset();
                                            }
                                        },
                                        irAListado: {
                                            text: 'Ir al listado',
                                            btnClass: 'btn-blue',
                                            // action lleva la acción a ejecutar cuando
                                            // se apriete el botón.
                                            action: function() {
                                                // Redireccionamos al usuario al listado.
                                                location.href = "#animes";
                                            }
                                        }
                                    }
                                });
                            }else{
                                $.alert({
                                    title: 'Alert!',
                                    content: `${rta.msg}`,
                                    type: 'red',
                                });
                            }
                        }
                    })
                }else{
                    $.alert({
                        title: 'Alert!',
                        content: `${rta.msg}`,
                        type: 'red',
                    });
                }
            }
        })
    })
})




function crearLista(animes) {
    var content = '';
    console.log(animes);
    for (var index = 0; index < animes.length; index++) {
        var anime = animes[index].data;
        content += `
            <section class="contenido-anime">
                <section class="img-center">
                    <img src="imgs/${anime.PORTADA}.jpg" alt="Portada ${anime.ANIME}" class="img-anime">
                </section>
                <section class="texto-anime">            
                    <h2 class="titulo-principal">${anime.ANIME.toUpperCase()}</h2>
                    <p>Sinopsis:</p>
                    <p>${anime.SINOPSIS}</p>
                    <section class="centrado-boton">
                    <button class="ui-btn ui-btn-inline boton" data-anime="${anime.ID}">Leer Más</button>
                    </section>
                </section>
            </section>
        `;
        
    }
    $("#animes ul[data-role='listview']").html(content);
}