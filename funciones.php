<?php
function getConexion()
{
  $server = 'localhost';
  $usuario = 'root';
  $pass = '';
  $bd = 'bdprueba';
  $cnx = new mysqli($server,$usuario,$pass,$bd);
  return $cnx;
}

function insertarCarrito($producto,$pedido,$cantidad)
{
  $cnx = getConexion();
  $st = "INSERT INTO carrito VALUES ('$producto',$pedido,$cantidad);";
  $res = $cnx->query($st);
  return $res;
}

function crearPedido()
{
  $cnx = getConexion();
  $st = "INSERT INTO pedido VALUES (null,null,null,null,null,null,null);";
  $res = $cnx->query($st);
  return $res;
}

function alterarPedido($id,$monto,$nombre,$apellido,$entrega,$direccion,$telefono)
{
  $cnx = getConexion();
  $st = "UPDATE pedido SET nombre = '$nombre',apellido='$apellido',monto=$monto,entrega=$entrega
  ,direccion='$direccion',telefono='$telefono' WHERE codigo = $id;";
  $res = $cnx->query($st);
  return $res;
}

function verAllProductos(){
  $cnx = getConexion();
  $st = "SELECT codigo, nombre, precio, descripcion FROM productos;";
  $res = $cnx->query($st);
  return $res;
}

function verProductosCarritoEsp($codigo)
{
  $cnx = getConexion();
  $st = "SELECT p.nombre as NOMBRE,car.precio as PRECIO,car.cantidad as CANTIDAD,pe.monto as MONTO,pe.entrega as ENTREGA FROM pedido pe JOIN carrito car on pe.codigo = car.codigo_pedido JOIN
   producto p on car.codigo_producto = p.codigo WHERE pe.codigo = $codigo;";
  $res = $cnx->query($st);
  return $res;
}

function eliminarPedido($codigo)
{
  $cnx = getConexion();
  $st = "DELETE FROM pedido WHERE codigo = $codigo;";
  $res = $cnx->query($st);
  return $res;
}

function eliminarCarrito($codigo)
{
  $cnx = getConexion();
  $st = "DELETE FROM carrito WHERE codigo_producto = '$codigo';";
  $res = $cnx->query($st);
  return $res;
}
 ?>
