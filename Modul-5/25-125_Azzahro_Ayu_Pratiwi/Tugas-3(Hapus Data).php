<?php
include "koneksi.php";
if (isset($_GET['id'])) {
    $no = $_GET['id'];

    $sql = "DELETE FROM supplier WHERE id='$id'";
    $hasil = mysqli_query($koneksi, $sql);

    if ($hasil) {
        header("Location: Tugas-1(Data Master).php");
        exit;
    } else {
        echo "Gagal menghapus data";
    }
} else {
    header("Location: Tugas-1(Data Master).php");
    exit;
}
?>
