<?php
include "koneksi.php";

if (isset($_POST['simpan'])) {
    $nama = $_POST['nama'];
    $telp = $_POST['telp'];
    $alamat = $_POST['alamat'];

    $sql = "INSERT INTO supplier VALUES(null,'$nama','$telp','$alamat')";
    $hasil = mysqli_query($koneksi, $sql);

    if ($hasil) {
        echo "Eksekusi tambah data berhasil";
        header("Location: Tugas-1(Data Master).php");
        exit;
    }
}
?>

<h2>Tambah Data Supplier</h2>

<form method="post" action=" Tugas-2(Tambah Master).php">
    Nama: <input type="text" name="nama" required></br>
    Telepon: <input type="text" name="telp" required></br>
    Alamat: <input type="text" name="alamat" required></br>
    <button type="submit" name="simpan">Simpan</button>
</form>

<a href=" Tugas-1(Data Master).php">Lihat Data</a>