-- Recipe Name and Description

insert into recipes (recipe_name, recipe_description) values
    ('Tomato Mushroom Risotto', 'Creamy Italian style risotto with tomato & mushroom')
;

-- Enter the recipe steps.

select *
from recipes
where recipe_name = 'Tomato Mushroom Risotto'
;

    -- insert into recipe_steps(recipe_id, step_number, instructions)
    -- select recipe_id, 1, 'In a large saucepan sauté the shallots with the olive oil for about 3 to 4 minutes.'
    -- from recipes
    -- where recipe_name = 'Tomato Mushroom Risotto'
    -- ;

    insert into recipe_steps(recipe_id, step_number, instructions)
    select recipe_id, 2, 'Add the mushrooms and continue to sauté for another 5 minutes, stirring frequently until softened.'
    from recipes
    where recipe_name = 'Tomato Mushroom Risotto'
    ;

    insert into recipe_steps(recipe_id, step_number, instructions)
    select recipe_id, 3, 'Stir in the rice and cook for another minute or two.'
    from recipes
    where recipe_name = 'Tomato Mushroom Risotto'
    ;

    insert into recipe_steps(recipe_id, step_number, instructions)
    select recipe_id, 4, 'Add the wine, stir and cook until absorbed.'
    from recipes
    where recipe_name = 'Tomato Mushroom Risotto'
    ;

    insert into recipe_steps(recipe_id, step_number, instructions)
    select recipe_id, 5, 'Pour in a quarter of the chicken broth, bring to a boil and cook until absorbed, stirring frequently.'
    from recipes
    where recipe_name = 'Tomato Mushroom Risotto'
    ;

    insert into recipe_steps(recipe_id, step_number, instructions)
    select recipe_id, 6, 'Gradually stir in the rest of the broth over a period of about 15 minutes, adding more as each previous amount is absorbed.'
    from recipes
    where recipe_name = 'Tomato Mushroom Risotto'
    ;

    insert into recipe_steps(recipe_id, step_number, instructions)
    select recipe_id, 7, 'When the rice is al dente, mix in the tomatoes and herbs.'
    from recipes
    where recipe_name = 'Tomato Mushroom Risotto'
    ;

    insert into recipe_steps(recipe_id, step_number, instructions)
    select recipe_id, 8, 'Check the seasoning and stir in the cheeses.'
    from recipes
    where recipe_name = 'Tomato Mushroom Risotto'
    ;

    insert into recipe_steps(recipe_id, step_number, instructions)
    select recipe_id, 9, 'Serve in warmed bowls topped with shaved aged Parmesan.'
    from recipes
    where recipe_name = 'Tomato Mushroom Risotto'
    ;

select 
    b.recipe_name,
    a.step_number,
    a.instructions
from recipe_steps a
left join recipes b
    on a.recipe_id = b.recipe_id
;


-- Search ingredients for previous entry
select * 
from ingredients a
left join ref_ingredient_types b
    on a.ingredient_type_code = b.ingredient_type_code
where ingredient_name like ('%olive%')
;


-- If not there then insert ingredient and description (description optional, see next step)
insert into ref_ingredient_types (ingredient_type_description) values
    ('Packed with amazing fresh nutty or buttery, somewhat bitter flavor and pungent aroma')
;

insert into ingredients (ingredient_type_code, ingredient_name)
select ingredient_type_code, 'Olive Oil' 
from ref_ingredient_types 
where ingredient_type_description = 'Packed with amazing fresh nutty or buttery, somewhat bitter flavor and pungent aroma';

-- quick & dirty version is to just enter '0' as the ingredient_type_code
insert into ingredients (ingredient_type_code, ingredient_name) values
    (0, 'Baby portabella mushrooms'),
    (0, 'Arborio rice'),
    (0, 'Dry white wine'),
    (0, 'Chicken stock'),
    (0, 'Plum tomatoes'),
    (0, 'Fresh basil'),
    (0, 'Fresh chives'),
    (0, 'Mascarpone cheese'),
    (0, 'Grated parmesan cheese'),
    (0, 'Salt'),
    (0, 'Black pepper')
;

