<?php

// 4.1. Tambahkan lima data baru ke dalam array $height, lalu tampilkan seluruh datanya dengan perulangan!

$height = [
    "Andy" => "176",
    "Barry" => "165",
    "Charlie" => "170"
];

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
echo ')<br>';

foreach ($height as $key => $value) {
    echo $key . " is " . $value . " cm tall.<br>";
}

// 4.2. Buat array baru dengan nama $weight yang memiliki tiga buah data! Tampilkan seluruh data dari array $weight dengan menggunakan stuktur perulangan FOR!
echo "<br>";
$weight = ["Andy" => "70", "Barry" => "65", "Charlie" => "75"];

echo "weight = (";
foreach ($weight as $key => $value) {
    echo '"' . $key . '"=>"' . $value . '"';
    if ($key != "Charlie") {
        echo ', ';
    }
}
echo ')';

echo "<br>";
$names = array_keys($weight);
$values = array_values($weight);

for ($i = 0; $i < count($weight); $i++) {
    echo $names[$i] . " is " . $values[$i] . " kg.<br>";
}
?>