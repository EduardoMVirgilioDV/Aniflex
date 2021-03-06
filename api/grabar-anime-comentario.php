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
$anime        = mysqli_real_escape_string($conexion, $_POST['anime']);
$comentario      = mysqli_real_escape_string($conexion, $_POST['comentario']);

$query = "INSERT INTO anime_comentario (ID, ANIME_ID, COMENTARIO_ID) 
        VALUES (NULL,$anime, $comentario)";

// Ejecutamos la consulta.
// Como esta no es una consulta de selección, mysqli_query solo retorna
// true o false.
$exito = mysqli_query($conexion, $query);

// Imprimimos el mensaje de error de MySQL.
echo mysqli_error($conexion);



if($exito) {
    $salida = [
        'success' => true,
        'msg' => 'El comentario se grabó exitosamente.',
        'consulta' => $query,
        'metadata' => mysqli_insert_id($conexion)
    ];
} else {
    $salida = [
        'success' => false,
        'msg' => 'Ocurrió un error al tratar de grabar la información. Por favor, probá de nuevo más tarde o comunicate con nosotros.'
    ];
}
// Retornamos el contenido de la salida, sea cual sea.
echo json_encode($salida);


