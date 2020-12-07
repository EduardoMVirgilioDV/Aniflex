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

$query_animes = "SELECT animes.* FROM animes";

// Ejecutamos la consulta.
$res_animes = mysqli_query($conexion, $query_animes);

// Como tenemos que retornar un solo datos que tenga todas las notas,
// vamos a necesitar guardarlas a todas, una por una, en un array, que
// luego podamos retornar.
$salida = [];

// Recorremos las notas para agregarlas al array.
while($anime = mysqli_fetch_assoc($res_animes)) {
  /*  $anime_id = $anime['ID'];
    $query_generos = "SELECT anime_generos.*, animes.*, generos.* FROM anime_generos 
    INNER JOIN generos ON anime_generos.GENERO = generos.ID 
    INNER JOIN animes ON anime_generos.ANIME = animes.ID 
    WHERE anime_generos.ANIME = '$anime_id'";
    $res_generos = mysqli_query($conexion, $query_generos);
    */
    // Hacemos el "push".
    $salida[]["data"] = $anime;
    /*
    while($genero = mysqli_fetch_assoc($res_generos)) {
        $salida[$anime_id-1]["generos"][] = $genero["genero"];
    }*/
}


// Todo archivo de una API debe retornar un único JSON.
// En otras palabras, solo podemos llamar al echo de json_encode una única
// vez.
echo json_encode($salida);




