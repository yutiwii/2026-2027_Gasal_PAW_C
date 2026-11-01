
<?php
include "koneksi.php";

$query = mysqli_query($koneksi, "SELECT * FROM supplier");
?>

<h2>Data Master Supplier</h2>
<table border="1">
    <tr>
        <th>No</th>
        <th>Nama</th>
        <th>Telepon</th>
        <th>Alamat</th>
        <th>Action</th>
    </tr>

    <?php while ($data = mysqli_fetch_assoc($query)) { ?>
    <tr>
        <td><?= $data['id']; ?></td>
        <td><?= ($data['nama']); ?></td>
        <td><?= ($data['telp']); ?></td>
        <td><?= ($data['alamat']); ?></td>
        <td>
            <a href="Tugas-4(Edit Data).php?id=<?= $data['id']; ?>">Edit</a> |
            <a href="Tugas-3(Hapus Data).php?id=<?= $data['id']; ?>"
               onclick="return confirm('Yakin ingin menghapus data ini?')">
               Delete
            </a>
        </td>
    </tr>
    <?php } ?>
</table>
<a href="Tugas-2(Tambah Data).php">Menambah Data</a>
