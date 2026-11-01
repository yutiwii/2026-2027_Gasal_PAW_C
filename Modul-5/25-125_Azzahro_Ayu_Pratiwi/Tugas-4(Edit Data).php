<?php
include "koneksi.php";
$id = $_GET['id'];
$query = mysqli_query($koneksi, "SELECT * FROM supplier WHERE id = $id");
$row = mysqli_fetch_assoc($query);

if (isset($_POST['simpan'])) {
    $id = $_POST['id'];
    $nama = $_POST['nama'];
    $telp = $_POST['telp'];
    $alamat = $_POST['alamat'];

    $sql = "UPDATE supplier set nama='$nama', telp='$telp', alamat='$alamat' where id=$id";
    $hasil = mysqli_query($koneksi, $sql);

    if ($hasil) {
        header("Location: Tugas-1(Data Master).php");
        exit;
    } else {
        echo "Gagal mengubah data";
    }
}
?>

<h2>Edit Data</h2>
 
<form method="post" action="Tugas-4(Edit Data).php?id=<?= $row['id']; ?>">
    <input type="hidden" name="id" value="<?php echo $row["id"]?>"></br>
    Nama: <input type="text" name="nama" value="<?php echo $row["nama"]?>"></br>
    Telepon: <input type="text" name="telp" value="<?php echo $row["telp"]?>"></br>
    Alamat: <input type="text" name="alamat" value="<?php echo $row["alamat"]?>"></br>
    <button type="submit" name="simpan">Update</button>
</form>

<a href="Tugas-1(Data Master).php">Lihat Data</a>