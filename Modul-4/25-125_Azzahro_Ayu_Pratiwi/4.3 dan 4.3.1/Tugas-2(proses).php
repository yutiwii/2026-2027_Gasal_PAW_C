<h3>Posted data: </h3>

<!-- method=POST -->
<?php
foreach ($_POST as $key => $value) {
    echo "($key) => ($value)<br/>";
}
?>

<!-- method=GET -->
<?php
foreach ($_GET as $key => $value) {
    echo "($key) => ($value)<br/>";
}
?>

<!-- Validasi akhir -->
<?php
require 'validate.inc';
$errors = array();

validateName($errors, $_POST, 'username');
if ($errors) {
    echo 'Errors:<br/>';
    foreach ($errors as $field => $error)
        echo "$field $error<br/>";
} else {
    echo 'Data OK!';
}
?>