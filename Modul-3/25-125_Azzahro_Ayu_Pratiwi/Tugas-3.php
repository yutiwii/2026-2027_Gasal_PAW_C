
<?php

// 3.1. Tambahkan lima data baru ke dalam array $height, lalu tampilkan nilai dengan indeks terakhir. Setelah itu, hapus satu data tertentu dan tampilkan kembali nilai dengan indeks terakhir!

$height = [
    "Andy" => "176",
    "Barry" => "165",
    "Charlie" => "170"
];
echo "Andy is " . $height['Andy'] ." cm tall. <br>";

$height["David"] = "180";
$height["Ethan"] = "172";
$height["Frank"] = "168";
$height["George"] = "175";
$height["Harry"] = "182";

echo 'height = (';
foreach ($height as $key => $value) {
    echo '"' . $key . '"=>"' . $value . '"';
    if ($key != "Harry") {
        echo ', ';
    }
}
echo ')';

echo "<br>Nilai dengan indeks terakhir: " . end($height);

echo "<br>";
unset($height["Barry"]);

echo "height = (";
foreach ($height as $key => $value) {
    echo '"' . $key . '"=>"' . $value . '"';
    if ($key != "Harry") {
        echo ', ';
    }
}
echo ')';

echo "<br>Nilai dengan indeks terakhir setelah dihapus: " . end($height). "<br>";
// 3.2. Buat array baru bernama $weight yang memiliki tiga data, lalu tampilkan data kedua dari array ini!
$weight = ["Andy" => "70", "Barry" => "65", "Charlie" => "75"];

echo "weight = (";
foreach ($weight as $key => $value) {
    echo '"' . $key . '"=>"' . $value . '"';
    if ($key != "Charlie") {
        echo ', ';
    }
}
echo ')';
echo "<br>Data kedua: " . array_values($weight)[1];
?>