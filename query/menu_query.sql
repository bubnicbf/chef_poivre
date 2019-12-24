select 
    a.menu_name,
    -- a.menu_description,
    -- b.menu_type_description,
    'Course ' || c.course_number,
    d.course_type_description,
    f.dish_element_description,
    g.recipe_name,
    -- g.recipe_description,
    'Step ' || h.step_number,
    i.amount_required,
    j.ingredient_name,
    h.instructions -- ,
    -- k.ingredient_type_description
from menus a
left join ref_menu_types b
    on a.menu_type_code = b.menu_type_code
left join menu_courses c
    on a.menu_id = c.menu_id
left join ref_course_types d
    on c.couse_type_code = d.couse_type_code
left join course_recipes e
    on c.menu_id = e.menu_id 
    and c.course_number = e.course_number
left join ref_dish_elements f
    on e.dish_element_code = f.dish_element_code
left join recipes g
    on e.recipe_id = g.recipe_id
left join recipe_steps h
    on g.recipe_id = h.recipe_id
left join recipes_step_ingredients i
    on h.recipe_id = i.recipe_id
    and h.step_number = i.step_number
left join ingredients j
    on i.ingredient_id = j.ingredient_id
left join ref_ingredient_types k
    on j.ingredient_type_code = k.ingredient_type_code
;

