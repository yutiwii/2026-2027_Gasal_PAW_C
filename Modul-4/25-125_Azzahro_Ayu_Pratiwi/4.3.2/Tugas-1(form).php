<?php
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    foreach ($_POST as $key => $value) {
        echo "($key) => ($value)<br/>";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Form</title>
    <style>
        fieldset {
            background-color: #8fd9f8;
        }
        .field {
            display: flex;
        }
        .field label {
            width: 100px;
            text-align: left;
            margin-right: 20px;
        }
    </style>
</head>
<body>
    <h1>Registrasi</h1>
    <fieldset>
        <legend><b>Person Details</b></legend>
        <?php
        $errors = [];
        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            require 'validate.inc';
            validateName($errors, $_POST, 'username');
            validateEmail($errors, $_POST, 'email');
            validatePassword($errors, $_POST, 'password');
            validateRequired($errors, $_POST, 'addres');
            validateState($errors, $_POST, 'state');
            validateGender($errors, $_POST, 'gender');
            if (!empty($errors)) {
                echo '<h3>Terjadi kesalahan pada form:</h3>';
                foreach ($errors as $field => $error) {
                    echo htmlspecialchars($field) . ': ' . htmlspecialchars($error) . '<br>';
                }
                include 'form.inc';
            } else {
                echo '<h3>Form berhasil dikirim!</h3>';
            }
        } else {
            include 'form.inc';
        }
        ?>
    </fieldset>
</body>
</html>
