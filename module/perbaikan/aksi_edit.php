<?php
session_start();
if (empty($_SESSION['namauser']) AND empty($_SESSION['passuser'])) {

	echo "<center>untuk mengakses modul, anda harus login <br>";
	echo "<a href=../../index.php><b>LOGIN</b></a></center>";
} else {
	include "../../lib/koneksi.php";
	include "../../lib/config.php";
	
	$idperbaikan = $_POST['idperbaikan'];
	$namaperbaikan = $_POST['namaperbaikan'];
	$poin = $_POST['poin'];
	
	$queryEdit = mysqli_query($connect,"UPDATE perbaikan SET nama_perbaikan ='$namaperbaikan', poin ='$poin' WHERE id_perbaikan='$idperbaikan'" );

	if ($queryEdit) {
		echo "<script> alert ('Data perbaikan Berhasil Diubah'); window.location = '$base_url'+'main.php?module=perbaikan';</script>";
	}
	else {
		echo "<script> alert('Data perbaikan Gagal Diubah'); window.location='main.php?module=edit_perbaikan&id_perbaikan='+'$idperbaikan';</script>";
	}
}
?>