<?php
function makeSlug($title) {
    $title = preg_replace('![\s]+!u', '-', strtolower($title));
    $title = preg_replace('![^-\pL\pN\s]+!u', '', $title);
    $title = preg_replace('![-\s]+!u', '-', $title);
    
    return trim($title, '-');
}
function VerifyAcess($params) {
    $role = GetRoleThroughApiKey($params['api_key']);
    switch ($role) {
        case '1':
        // Admin
        // All Access Granted
        var_dump (1);
            break;
        case '2':
        // Visiteur
        var_dump(2);
            break;
        case '3':
        // OnlyByBrand
        var_dump(3);
            break;
}
}

function GetRoleThroughApiKey($ApiKey) {
    global $pdo;
    $sql ="SELECT role FROM users
                        WHERE api_key =:apikey";
$req= $pdo->prepare($sql);
$req->execute(['apikey' => $ApiKey]);
return $req->fetchAll();
}
