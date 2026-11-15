
<?php
include "koneksi.php";

$tanggal_mulai = "";
$tanggal_selesai = "";
$data = [];
$jumlah_pelanggan = 0;
$total_pendapatan = 0;
$pesan = "";

if (isset($_POST['tampilkan'])) {
    $tanggal_mulai = $_POST['tanggal_mulai'] ?? "";
    $tanggal_selesai = $_POST['tanggal_selesai'] ?? "";

    if ($tanggal_mulai != "" && $tanggal_selesai != "") {
        if ($tanggal_mulai > $tanggal_selesai) {
            $pesan = "Tanggal mulai tidak boleh melebihi tanggal selesai.";
        } else {
            // Rekap pendapatan per hari
            $query = "SELECT waktu_transaksi,
                             SUM(total) AS total_pendapatan
                      FROM transaksi
                      WHERE waktu_transaksi BETWEEN ? AND ?
                      GROUP BY waktu_transaksi
                      ORDER BY waktu_transaksi ASC";

            $stmt = mysqli_prepare($koneksi, $query);
            mysqli_stmt_bind_param($stmt, "ss", $tanggal_mulai, $tanggal_selesai);
            mysqli_stmt_execute($stmt);
            $hasil = mysqli_stmt_get_result($stmt);

            while ($row = mysqli_fetch_assoc($hasil)) {
                $data[] = $row;
            }
            mysqli_stmt_close($stmt);

            // Ringkasan pelanggan unik dan pendapatan keseluruhan
            $query_ringkasan = "SELECT
                COUNT(DISTINCT pelanggan_id) AS jumlah_pelanggan,
                COALESCE(SUM(total), 0) AS total_pendapatan
                FROM transaksi
                WHERE waktu_transaksi BETWEEN ? AND ?";

            $stmt = mysqli_prepare($koneksi, $query_ringkasan);
            mysqli_stmt_bind_param($stmt, "ss", $tanggal_mulai, $tanggal_selesai);
            mysqli_stmt_execute($stmt);
            $hasil_ringkasan = mysqli_stmt_get_result($stmt);
            $ringkasan = mysqli_fetch_assoc($hasil_ringkasan);

            $jumlah_pelanggan = $ringkasan['jumlah_pelanggan'];
            $total_pendapatan = $ringkasan['total_pendapatan'];

            mysqli_stmt_close($stmt);
        }
    }
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Laporan Penjualan</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        @media print {
            form, button, a {display: none;}
        }
    </style>
</head>
<body>

    <h2>Laporan Penjualan</h2>
    <form method="POST" action="">
        <label>Tanggal Mulai:</label>
        <input type="date" name="tanggal_mulai"
               value="<?php echo htmlspecialchars($tanggal_mulai); ?>" required>
        <label>Tanggal Selesai:</label>
        <input type="date" name="tanggal_selesai"
               value="<?php echo htmlspecialchars($tanggal_selesai); ?>" required>
        <button type="submit" name="tampilkan">Tampilkan</button>
    </form>

    <?php if (isset($_POST['tampilkan']) && $pesan != "") { ?>
        <p><?php echo htmlspecialchars($pesan); ?></p>
    <?php } ?>
    <?php if (isset($_POST['tampilkan']) && $pesan == "") { ?>

        <h3>Grafik Batang Penjualan Harian</h3>
        <?php if (count($data) > 0) { ?>
            <canvas id="grafikPenjualan" width="550" height="300"></canvas>
            <script>
                const tanggal = <?php
                    echo json_encode(array_column($data, 'waktu_transaksi'));
                ?>;

                const pendapatan = <?php
                    echo json_encode(array_map('floatval', array_column($data, 'total_pendapatan')));
                ?>;

                new Chart(document.getElementById('grafikPenjualan'), {
                    type: 'bar',
                    data: {
                        labels: tanggal,
                        datasets: [{
                            label: 'Total Pendapatan (Rp)',
                            data: pendapatan
                        }]
                    },
                    options: {
                        responsive: false,
                        scales: {
                            x: {
                                title: {
                                    display: true,
                                    text: 'Tanggal Transaksi'
                                }
                            },
                            y: {
                                beginAtZero: true,
                                title: {
                                    display: true,
                                    text: 'Total Pendapatan (Rp)'
                                }
                            }
                        }
                    }
                });
            </script>
        <?php } else { ?>
            <p>Tidak ada transaksi pada rentang tanggal tersebut.</p>
        <?php } ?>

        <h3>Rekapitulasi Penjualan Harian</h3>
        <table border="1" cellpadding="8" cellspacing="0">
            <tr>
                <th>No</th>
                <th>Total Pendapatan</th>
                <th>Tanggal Transaksi</th>
            </tr>

            <?php if (count($data) > 0) { ?>
                <?php $no = 1; ?>
                <?php foreach ($data as $row) { ?>
                    <tr>
                        <td><?php echo $no++; ?></td>
                        <td>Rp <?php echo number_format($row['total_pendapatan'], 0, ',', '.'); ?></td>
                        <td><?php echo htmlspecialchars($row['waktu_transaksi']); ?></td>
                    </tr>
                <?php } ?>
            <?php } else { ?>
                <tr>
                    <td colspan="3">Tidak ada transaksi pada rentang tanggal tersebut.</td>
                </tr>
            <?php } ?>
        </table>

        <h3>Ringkasan Penjualan</h3>
        <table border="1" cellpadding="8" cellspacing="0">
            <tr>
                <th>Jumlah Pelanggan Unik</th>
                <th>Total Pendapatan Keseluruhan</th>
            </tr>
            <tr>
                <td><?php echo $jumlah_pelanggan; ?> pelanggan</td>
                <td>Rp <?php echo number_format($total_pendapatan, 0, ',', '.'); ?></td>
            </tr>
        </table>
        <br>
        <button type="button" onclick="window.print()">Cetak</button>
        <a href="ekspor_excel.php?tanggal_mulai=<?php
            echo urlencode($tanggal_mulai);
        ?>&tanggal_selesai=<?php
            echo urlencode($tanggal_selesai);
        ?>">Ekspor Excel</a>
    <?php } ?>
    <br><br>
    <a href="index.php">Kembali</a>
</body>
</html>