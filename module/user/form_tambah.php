<?php
include "lib/config.php";
include "lib/koneksi.php";
session_start();
if (empty($_SESSION['namauser']) && empty($_SESSION['passuser'])) {
    echo "<center>Untuk mengakses modul, Anda harus login <br>";
    echo "<a href=$admin_url><b>LOGIN</b></a></center>";
} elseif ($_SESSION['akses'] == 1 || $_SESSION['akses'] == 2) { ?>
    <div class="right_col" role="main">
        <div class="">
            <div class="page-title">
                <div class="title_left">
                    <h3>Tambah Data User<small></small></h3>
                </div>
                <div class="title_right">
                    <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                        <div class="input-group">
                            <input type="text" class="form-control" placeholder="Cari...">
                            <span class="input-group-btn">
                                <button class="btn btn-default" type="button"><i class="fa fa-search"></i></button>
                            </span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
            <!-- Form -->
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <div class="x_panel">
                        <div class="x_title">
                            <h2>Form Tambah User</h2>
                            <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                            <br />
                            <form id="demo-form2" data-parsley-validate class="form-horizontal form-label-left" action="module/user/aksi_simpan.php" method="post">

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="username">Username</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" id="username" name="username" required="required" class="form-control col-md-7 col-xs-12">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12" for="password">Password</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="password" id="password" name="password" required="required" class="form-control col-md-7 col-xs-12">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">NIS / Nama</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" name="siswa" id="autocomplete-siswa" class="form-control col-md-10" style="float: left;" />
                                        <div id="autocomplete-container" style="position: relative; float: left; width: 400px; margin: 10px;"></div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">NIP</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" name="guru" id="autocomplete-custom-append" class="form-control col-md-10" style="float: left;" />
                                        <div id="autocomplete-container" style="position: relative; float: left; width: 400px; margin: 10px;"></div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">ID Ortu</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <input type="text" name="ortu" id="autocomplete-ortu" class="form-control col-md-10" style="float: left;" />
                                        <div id="autocomplete-container" style="position: relative; float: left; width: 400px; margin: 10px;"></div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-md-3 col-sm-3 col-xs-12">Hak Akses</label>
                                    <div class="col-md-6 col-sm-6 col-xs-12">
                                        <select name="hakAkses" class="form-control" required="required">
                                            <option disabled="disabled">-- Hak Akses --</option>
                                            <option value="1">1 - Administrator</option>
                                            <option value="2">2 - Kesiswaan</option>
                                            <option value="3">3 - Wali Kelas</option>
                                            <option value="4">4 - Kepala Sekolah</option>
                                            <option value="5">5 - Siswa / Orang Tua</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="ln_solid"></div>
                                <div class="form-group">
                                    <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                                        <button type="reset" class="btn btn-primary" onclick="window.location='main.php?module=user'">Cancel</button>
                                        <button type="submit" class="btn btn-success">Submit</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php 
} else {
    echo "Anda Harus Login Untuk Mengakses Halaman Ini";
}
?>
