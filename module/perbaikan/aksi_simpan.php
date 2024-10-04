<?php
    include "../../lib/config.php";
    include "../../lib/koneksi.php";

    $namaperbaikan = $_POST['namaperbaikan'];
    $poin = $_POST['poin'];

    $querySimpan = mysqli_query($connect,"INSERT INTO perbaikan (nama_perbaikan, poin) VALUES ('$namaperbaikan', '$poin')");

    if ($querySimpan) {
        echo "<script> alert('Data perbaikan Berhasil Masuk'); window.location = '$base_url'+'main.php?module=perbaikan';</script>";
    }
    else {
        echo "<script> alert('Data perbaikan Gagal Dimasukkan'); window.location = '$base_url'+'main.php?module=tambah_perbaikan';</script>";
    }

?>