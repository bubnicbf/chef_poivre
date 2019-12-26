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
where b.recipe_name = 'Tomato Mushroom Risotto'
;


-- Search ingredients for previous entry
select * 
from ingredients a
left join ref_ingredient_types b
    on a.ingredient_type_code = b.ingredient_type_code
where ingredient_name like ('%olive oil%')
;


-- If not there then insert ingredient and description (description optional, see next step)
insert into ref_ingredient_types (ingredient_type_description) values
    ('Packed with amazing fresh nutty or buttery, somewhat bitter flavor and pungent aroma')
;

insert into ingredients (ingredient_type_code, ingredient_name)
select ingredient_type_code, 'Olive Oil' 
from ref_ingredient_types 
where ingredient_type_description = 'Packed with amazing fresh nutty or buttery, somewhat bitter flavor and pungent aroma';


-- Link the recipe steps with the ingredients and specify amounts.

select *
from recipes_step_ingredients a
left join recipes b
    on a.recipe_id = b.recipe_id
;


insert into recipes_step_ingredients (recipe_id, step_number, ingredient_id, amount_required)
select 4651, 1, ingredient_id, '1 large' from ingredients where ingredient_name = 'Olive oil'
union all
select 4651, 1, ingredient_id, '4 Tbsp' from ingredients where ingredient_name = 'Shallots'
union all
select 4651, 2, ingredient_id, '8 oz.' from ingredients where ingredient_name = 'Baby portobello mushrooms'
union all
select 4651, 3, ingredient_id, '10 oz.' from ingredients where ingredient_name = 'Arborio rice'
union all
select 4651, 4, ingredient_id, '1/2 c.' from ingredients where ingredient_name = 'Dry white wine'
union all
select 4651, 5, ingredient_id, '4 c.' from ingredients where ingredient_name = 'Low sodium chicken broth'
union all
select 4651, 6, ingredient_id, '4 c.' from ingredients where ingredient_name = 'Low sodium chicken broth'
union all
select 4651, 7, ingredient_id, '8 oz.' from ingredients where ingredient_name = 'Plum tomatoes'
union all
select 4651, 7, ingredient_id, '1 Tbsp' from ingredients where ingredient_name = 'Basil'
union all
select 4651, 7, ingredient_id, '1 Tbsp' from ingredients where ingredient_name = 'Fresh chives'
union all
select 4651, 8, ingredient_id, 'To taste' from ingredients where ingredient_name = 'Sea salt'
union all
select 4651, 8, ingredient_id, 'To taste' from ingredients where ingredient_name = 'Ground black pepper'
union all
select 4651, 8, ingredient_id, '2 Tbsp' from ingredients where ingredient_name = 'Mascarpone'
union all
select 4651, 8, ingredient_id, '3 Tbsp' from ingredients where ingredient_name = 'Freshly grated parmesan'
union all
select 4651, 9, ingredient_id, 'Garnish' from ingredients where ingredient_name = 'Freshly grated parmesan'
;