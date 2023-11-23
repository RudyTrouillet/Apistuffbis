<?php

function getBySlug($params) {
    require_once '../config/db.php';    
    
    $request_car_all ="SELECT cars.NAME AS NomVoiture,
                        cars.slug AS Slug,
                        cars.description AS CarDescript,
                        models.name AS ModelName,
                        models.finition AS ModelFinition,
                        models.hp AS HorsePower,
                        models.cv AS TaxHorsePower,
                        models.door AS Door,
                        brands.name AS BrandName,
                        ATT.value_attribute AS Color,
                        ATT2.value_attribute AS Energy,
                        ATT3.value_attribute AS TransmissionType
                        FROM cars
                        INNER JOIN MODELS ON cars.model_id=models.id
                        INNER JOIN brands ON models.brand_id=brands.id
                        INNER JOIN attributes ATT ON cars.attribute_color_id=ATT.id
                        INNER JOIN attributes ATT2 ON models.attribute_energy_id=ATT2.id
                        INNER JOIN attributes ATT3 ON models.attribute_boite_id=ATT3.id
                        WHERE cars.slug ='$params'";
$Result_all = $pdo->query($request_car_all);
echo"</p>";
foreach ($Result_all as $row) {
    echo $row['NomVoiture'] . "|".$row['Slug'] . "|".$row['CarDescript'] . "|".$row['HorsePower'] . "|".$row['ModelName'] . "</p>";
}
}

