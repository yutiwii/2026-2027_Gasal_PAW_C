<?php 

// 1.1. Menambahkan lima data baru dalam array $fruits! Tampilkan nilai dengan indeks tertinggi dari array $fruits!

$fruits =  ["Avocado", "Blueberry", "Cherry"];
$fruits[] = "Durian";
$fruits[] = "Elderberry";
$fruits[] = "Fig";
$fruits[] = "Grape";
$fruits[] = "Honeydew";
echo 'fruits = ("' . implode('", "', $fruits) . '")';
echo "<br>Nilai dengan indeks tertinggi: " . $fruits[count($fruits) - 1];

// 1.2. Hapus satu data tertentu dari array $fruits! Tampilkan nilai dengan indeks tertinggi dari array $fruits!

echo "<br>";
unset($fruits[1]);
$fruits = array_values($fruits);

echo "Data Blueberry dihapus.<br>";
echo 'fruits = ("' . implode('", "', $fruits) . '")';
echo "<br>Nilai dengan indeks tertinggi: " . $fruits[count($fruits) - 1];
?>