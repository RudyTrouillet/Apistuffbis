# Liste des endpoints
- /cars : Liste des voitures disponibles
- /car/{slug} : Une seule voiture avec son slug (composé de l'ID + le nom)
- /cars/brand/{slug} : Liste des voitures de la marque (slug de la marque)
- /cars/category/{slug} : Liste des voitures selon la catégorie

- /categories : Liste des catégories (Berline / Break / SUV ...)
- /brands : Liste des marques


# Liste des paramètres
- /cars/
  - ?energy=essence
    - =hybride-essence
    - =hybride-diesel
    - =electric
    - =GPL
    - =diesel
  - ?boite=manuelle
    - =auto
    - =semi-auto
  - ?color=red
    - =black
  - ?door=2
    - =3
    - =4
    - =5

# Liste des tables DB
- brands : id,name,slug,logo
- models : id_model, brand_id, name, phase, syear, eyear, finition, hp, cv, door, attribute_energy_id, attribute_boite_id, attribute_category_id
- attributes : id_attribute, key_attribute, value_attribute
  - Exemple 1 : 1,ENERGY,DIESEL
  - Exemple 2 : 2,COLOR,BLACK
  - Exemple 3 : 3,BOITE,AUTO
  - Exemple 4 : 4,CATEGORY,SUV
- cars : id_car, name, slug, description, first_immat_date, model_id, aff_price, sell_price, attribute_color_id, siv, etat, km, in_date, out_date
- images : id_image, car_id, url, order