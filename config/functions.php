<?php
function makeSlug($title) {
    $title = preg_replace('![\s]+!u', '-', strtolower($title));
    $title = preg_replace('![^-\pL\pN\s]+!u', '', $title);
    $title = preg_replace('![-\s]+!u', '-', $title);
    
    return trim($title, '-');
}