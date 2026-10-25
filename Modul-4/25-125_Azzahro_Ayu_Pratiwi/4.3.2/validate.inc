<?php
// Validasi username
function validateName(&$errors, $field_list, $field_name)
{
    $pattern = "/^[a-zA-Z'-]+$/"; // format surname (alfabet)
    if (!isset($field_list[$field_name]) || empty($field_list[$field_name]))
        $errors[$field_name] = 'required';
    else if (!preg_match($pattern, $field_list[$field_name]))
        $errors[$field_name] = 'invalid';
}

// Validasi email
function validateEmail(&$errors, $field_list, $field_name)
{
    if (!isset($field_list[$field_name]) || trim($field_list[$field_name]) === '')
        $errors[$field_name] = 'required';
    else if (!filter_var($field_list[$field_name], FILTER_VALIDATE_EMAIL))
        $errors[$field_name] = 'invalid (format email salah)';
}

// Validasi Password, minimal 6 karakter
function validatePassword(&$errors, $field_list, $field_name)
{
    if (!isset($field_list[$field_name]) || $field_list[$field_name] === '')
        $errors[$field_name] = 'required';
    else if (strlen($field_list[$field_name]) < 6)
        $errors[$field_name] = 'invalid (minimal 6 karakter)';
}

// Validasi Field teks biasa
function validateRequired(&$errors, $field_list, $field_name)
{
    if (!isset($field_list[$field_name]) || trim($field_list[$field_name]) === '')
        $errors[$field_name] = 'required';
}

// Validasi State
function validateState(&$errors, $field_list, $field_name)
{
    if (!isset($field_list[$field_name]) || $field_list[$field_name] === '')
        $errors[$field_name] = 'required (pilih salah satu state)';
    else if (!in_array($field_list[$field_name], array('1','2','3','4','5','6'), true))
        $errors[$field_name] = 'invalid';
}

// Validasi Gender
function validateGender(&$errors, $field_list, $field_name)
{
    if (!isset($field_list[$field_name]))
        $errors[$field_name] = 'required';
    else if (!in_array($field_list[$field_name], array('male','female'), true))
        $errors[$field_name] = 'invalid';
}