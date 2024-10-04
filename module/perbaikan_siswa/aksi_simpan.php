<?php
    include "../../lib/config.php";
    include "../../lib/koneksi.php";

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
    


    $querySimpan = mysqli_query($connect,"INSERT INTO detail_poin (tanggal, tahun_ajaran, nis, id_perbaikan, ket) VALUES ('$tanggal', '$thAjaran', '$nis', '$idperbaikan', '$ket')");

    if ($querySimpan) {
        echo "<script> alert('Data perbaikan Siswa Berhasil Masuk'); window.location = '$base_url'+'main.php?module=input_perbaikan_siswa';</script>";
    }
    else {
        echo "<script> alert('Data Pelanggaran Siswa Gagal Dimasukkan'); window.location = '$base_url'+'main.php?module=tambah_perbaikan_siswa';</script>";

    }

?>