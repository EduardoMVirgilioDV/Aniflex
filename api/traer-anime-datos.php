<?php
/*
En este archivo vamos a recibir los datos que jQuery nos mande,
guardarlos en la base de datos, y retornar un mensaje de éxito o error en
formato JSON.
*/
// Indicamos que el resultado es un JSON. Esto va a permitir que no solo el
// browser, sino jQuery sepan que la respuesta la deben parsear como JSON.
header("Content-Type: application/json; charset=utf-8");

// Agregamos la conexión y traemos el nombre y apellido de algún docente.
require 'conexion.php';

// Capturamos los datos que llegan por POST.
$id = mysqli_real_escape_string($conexion, $_POST['id']);

$query_anime = "SELECT * FROM animes WHERE ID = '$id'";

// Ejecutamos la consulta.
$respuesta_anime = mysqli_query($conexion, $query_anime);

// Como tenemos que retornar un solo datos que tenga todas las notas,
// vamos a necesitar guardarlas a todas, una por una, en un array, que
// luego podamos retornar.
$salida = [];

// Recorremos las notas para agregarlas al array.
while($anime = mysqli_fetch_assoc($respuesta_anime)) {
    // Hacemos el "push".
    $salida[]["data"] = $anime;
    $anime_id = $anime['ID'];


    $query_generos = "SELECT anime_genero.ANIME_ID AS ag_a,anime_genero.GENERO_ID AS ag_g, animes.*, generos.ID AS genero_id, generos.GENERO AS genero_name 
    FROM anime_genero 
    INNER JOIN generos ON anime_genero.GENERO_ID = generos.ID 
    INNER JOIN animes ON anime_genero.ANIME_ID = animes.ID 
    WHERE anime_genero.ANIME_ID = '$anime_id'";
    $res_generos = mysqli_query($conexion, $query_generos);
    while($genero = mysqli_fetch_assoc($res_generos)) {
        $salida[$anime_id-1]["generos"][] = array("genero_id" => $genero['genero_id'],"genero_name" => $genero['genero_name']);
    }

    $query_comentarios = "SELECT anime_comentario.ANIME_ID AS ac_a,anime_comentario.COMENTARIO_ID AS ag_c, animes.*, comentarios.id AS comentario_id, comentarios.capitulo, comentarios.nota, comentarios.asunto, comentarios.texto 
    FROM anime_comentario 
    INNER JOIN comentarios ON anime_comentario.COMENTARIO_ID = comentarios.ID 
    INNER JOIN animes ON anime_comentario.ANIME_ID = animes.ID WHERE anime_comentario.ANIME_ID = '$anime_id'";
    $res_comentario = mysqli_query($conexion, $query_comentarios);
    while($comentario = mysqli_fetch_assoc($res_comentario)) {
        $salida[$anime_id-1]["comentarios"][] = array("capitulo" => $comentario['capitulo'],"nota" => $comentario['nota'], "asunto" => $comentario['asunto'] , "texto" => $comentario['texto'] );
    }
}


// Todo archivo de una API debe retornar un único JSON.
// En otras palabras, solo podemos llamar al echo de json_encode una única
// vez.
echo json_encode($salida);




