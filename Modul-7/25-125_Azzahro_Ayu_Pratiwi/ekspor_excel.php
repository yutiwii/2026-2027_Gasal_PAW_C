<?php
include "koneksi.php";

$tanggal_mulai = $_GET['tanggal_mulai'] ?? "";
$tanggal_selesai = $_GET['tanggal_selesai'] ?? "";

if ($tanggal_mulai == "" || $tanggal_selesai == "" ||
    $tanggal_mulai > $tanggal_selesai) {
    die("Rentang tanggal tidak valid.");
}

$mulai = mysqli_real_escape_string($koneksi, $tanggal_mulai);
$selesai = mysqli_real_escape_string($koneksi, $tanggal_selesai);

$query = mysqli_query($koneksi, "SELECT waktu_transaksi,
                                 SUM(total) AS total_pendapatan
                                 FROM transaksi
                                 WHERE waktu_transaksi BETWEEN '$mulai' AND '$selesai'
                                 GROUP BY waktu_transaksi
                                 ORDER BY waktu_transaksi ASC");

if (!$query) {
    die("Query gagal: " . mysqli_error($koneksi));
}

header("Content-Type: application/vnd.ms-excel; charset=utf-8");
header("Content-Disposition: attachment; filename=laporan_penjualan.xls");
header("Pragma: no-cache");
header("Expires: 0");

echo "<table border='1'>";
echo "<tr><th>No</th><th>Total Pendapatan</th><th>Tanggal Transaksi</th></tr>";

$no = 1;
while ($row = mysqli_fetch_assoc($query)) {
    echo "<tr>";
    echo "<td>" . $no++ . "</td>";
    echo "<td>" . $row['total_pendapatan'] . "</td>";
    echo "<td>" . htmlspecialchars($row['waktu_transaksi']) . "</td>";
    echo "</tr>";
}
echo "</table>";
?>
