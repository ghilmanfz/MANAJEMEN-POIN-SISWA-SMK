<?php
session_start();
if (empty($_SESSION['namauser']) AND empty($_SESSION['passuser'])) {

    echo "<center>untuk mengakses modul, anda harus login <br>";
    echo "<a href=../../index.php><b>LOGIN</b></a></center>";
} else {
    include "../../lib/koneksi.php";
    include "../../lib/config.php";
    
    $idDetailPoin = $_POST['idDetailPoin'];
    $thAjaran = $_POST['thAjaran'];
    $tanggal = $_POST['tanggal'];
    $ket = $_POST['ket'];
    $siswa = $_POST['siswa'];
    $nis=substr($siswa, 0,9);

    $perbaikan = $_POST['perbaikan'];
    if (substr($perbaikan, 2,1)=="-"){
        $idperbaikan=substr($perbaikan, 0,1);    
    }elseif (substr($perbaikan, 3,1)=="-") {
        $idperbaikan=substr($perbaikan, 0,2);
    }else{
        $idperbaikan=substr($perbaikan, 0,3);
    }
    
    $queryEdit = mysqli_query($connect,"UPDATE detail_poin SET tanggal='$tanggal', nis='$nis', id_perbaikan='$idperbaikan', tahun_ajaran='$thAjaran', ket='$ket' WHERE id_detail_poin='$idDetailPoin'" );

    if ($queryEdit) {
        echo "<script> alert ('Data perbaikan Siswa Berhasil Diubah'); window.location = '$base_url'+'main.php?module=input_perbaikan_siswa';</script>";
    }
    else {
        echo "<script> alert('Data perbaikan Siswa Gagal Diubah'); window.location='main.php?module=edit_perbaikan_siswa&id_detail_poin='+'$idDetailPoin';</script>";
    }
}
?>