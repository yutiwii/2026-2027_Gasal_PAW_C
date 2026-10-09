
<?php

// 1. array_push()
$array = ["A"];
echo "Array awal: (\"" . implode('", "', $array) . "\")<br>";

array_push($array, "B");
echo "Hasil array_push: " . implode(" ", $array) . "<br><br>";


// 2. array_merge()
$array1 = ["A", "B"];
$array2 = ["C"];

echo 'Array awal: ("' . implode('", "', $array1) . '") digabung dengan ("' . implode('", "', $array2) . '")<br>';

$hasil = array_merge($array1, $array2);
echo "Hasil array_merge: " . implode(" ", $hasil) . "<br><br>";


// 3. array_values()
$array = ["x" => 1, "y" => 2];

echo 'Array awal: ("x" => 1, "y" => 2)<br>';

$hasil = array_values($array);
echo "Hasil array_values: " . implode(" ", $hasil) . "<br><br>";


// 4. array_search()
$array = ["A", "B", "C"];

echo 'Mencari "B" pada array: ("' . implode('", "', $array) . '")<br>';

$hasil = array_search("B", $array);
echo "Hasil array_search: " . $hasil . "<br><br>";


// 5. array_filter()
$array = [0, 1, false, 2, "", 3, "array"];

echo 'Array awal: (0, 1, false, 2, "", 3, "array")<br>';

$hasil = array_filter($array);
echo "Hasil array_filter: " . implode(" ", $hasil) . "<br><br>";


// 6. sort() dan rsort()
$array = [3, 1, 2];

echo "Array awal: (3, 1, 2)<br>";

sort($array);
echo "Hasil sort: " . implode(" ", $array) . "<br>";

rsort($array);
echo "Hasil rsort: " . implode(" ", $array) . "<br><br>";


// 7. asort() dan arsort()
$array = ["Peter" => 35, "Ben" => 37, "Joe" => 43];

echo 'Array awal: ("Peter"=>35, "Ben"=>37, "Joe"=>43)<br>';

asort($array);
echo "Hasil asort: ";
foreach ($array as $key => $value) {
    echo $key . "=> " . $value . ", ";
}

echo "<br>Hasil ksort: ";
ksort($array);
foreach ($array as $key => $value) {
    echo $key . "=> " . $value . ", ";
}

echo "<br>Hasil arsort: ";
arsort($array);
foreach ($array as $key => $value) {
    echo $key . "=> " . $value . ", ";
}

echo "<br>Hasil krsort: ";
krsort($array);
foreach ($array as $key => $value) {
    echo $key . "=> " . $value . ", ";
}

?>