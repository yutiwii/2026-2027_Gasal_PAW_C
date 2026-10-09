
<?php
$students = [
    "Alex" => ["220401", "0812345678"],
    "Bianca" => ["220402", "0812345687"],
    "Candice" => ["220403", "0812345665"]
];

echo "Data awal:<br>";
echo "students = <br>";
foreach ($students as $name => $data) {
    echo '("' . $name . '", "' . $data[0] . '", "' . $data[1] . '")<br>';
}

$students["Daniel"] = ["220404", "0812345611"];
$students["Elena"] = ["220405", "0812345622"];
$students["Fiona"] = ["220406", "0812345633"];
$students["Gabe"] = ["220407", "0812345644"];
$students["Hannah"] = ["220408", "0812345655"];

echo "<br>Data setelah ditambah 5 data lain:<br>";
echo "students = <br>";
foreach ($students as $name => $data) {
    echo '("' . $name . '", "' . $data[0] . '", "' . $data[1] . '")<br>';
}

echo "<br>";
echo "<table border='1' cellspacing='0' cellpadding='3'>";
echo "<tr><th>Name</th><th>NIM</th><th>Mobile</th></tr>";

foreach ($students as $name => $data) {
    echo "<tr>";
    echo "<td>" . $name . "</td>";
    echo "<td>" . $data[0] . "</td>";
    echo "<td>" . $data[1] . "</td>";
    echo "</tr>";
}

echo "</table>";
?>