CREATE TABLE ref_menu_types (
    menu_type_code INTEGER PRIMARY KEY AUTOINCREMENT,
    menu_type_description TEXT NOT NULL
);

insert into ref_menu_types values (854775912,'Christmas');

insert into ref_menu_types (menu_type_description) values
    ('Thanksgiving'),
    ('Independence Day');


------------------------------------------------------------------------

CREATE TABLE menus(
   menu_id INTEGER PRIMARY KEY AUTOINCREMENT,
   menu_type_code INTEGER,
   menu_name TEXT NOT NULL,
   menu_description TEXT NOT NULL,
   FOREIGN KEY (menu_type_code) 
      REFERENCES ref_menu_types (menu_type_code) 
         ON DELETE CASCADE 
         ON UPDATE NO ACTION
);

insert into menus values(223372036, 854775912, 'Christmas Eve 2019', 'Duck breast and goosberry sauce with roasted chestnuts, swiss chard, and pumpkin mash');

------------------------------------------------------------------------

CREATE TABLE ref_course_types (
    couse_type_code INTEGER PRIMARY KEY AUTOINCREMENT,
    course_type_description TEXT NOT NULL
);

insert into ref_course_types values (42949,'Appetizer');

insert into ref_course_types (course_type_description) values
    ('Entree'),
    ('Dessert');
    

------------------------------------------------------------------------

CREATE TABLE menu_courses(
   menu_id INTEGER,
   course_number INTEGER,
   couse_type_code TEXT NOT NULL,
   PRIMARY KEY (menu_id, course_number),
   FOREIGN KEY (menu_id) 
      REFERENCES menus (menu_id) 
         ON DELETE CASCADE 
         ON UPDATE NO ACTION,
   FOREIGN KEY (course_number) 
      REFERENCES course_recipes (course_number) 
         ON DELETE CASCADE 
         ON UPDATE NO ACTION
   FOREIGN KEY (couse_type_code) 
      REFERENCES ref_course_types (couse_type_code) 
         ON DELETE CASCADE 
         ON UPDATE NO ACTION
);


insert into menu_courses values (223372036, 1, 42949);


------------------------------------------------------------------------

CREATE TABLE ref_dish_elements (
    dish_element_code INTEGER PRIMARY KEY AUTOINCREMENT,
    dish_element_description TEXT NOT NULL
);

insert into ref_dish_elements values (4398,'Vegetarian');

insert into ref_dish_elements (dish_element_description) values
    ('Garnish'),
    ('Sauce'),
    ('Protein');
    

------------------------------------------------------------------------

CREATE TABLE course_recipes(
   course_recipe_id INTEGER,
   menu_id INTEGER,
   course_number INTEGER,
   dish_element_code INTEGER,
   recipe_id INTEGER NOT NULL,
   PRIMARY KEY (course_recipe_id, menu_id, course_number),
   FOREIGN KEY (menu_id) 
      REFERENCES menu_courses (menu_id) 
         ON DELETE CASCADE 
         ON UPDATE NO ACTION,
   FOREIGN KEY (course_number) 
      REFERENCES menu_courses (course_number) 
         ON DELETE CASCADE 
         ON UPDATE NO ACTION,
   FOREIGN KEY (dish_element_code) 
      REFERENCES ref_dish_elements (dish_element_code) 
         ON DELETE CASCADE 
         ON UPDATE NO ACTION,
   FOREIGN KEY (recipe_id) 
      REFERENCES recipes (recipe_id) 
         ON DELETE CASCADE 
         ON UPDATE NO ACTION
);

insert into course_recipes values (4651, 223372036, 1, 4398, 4651);


------------------------------------------------------------------------

CREATE TABLE recipes (
    recipe_id INTEGER PRIMARY KEY AUTOINCREMENT,
    recipe_name TEXT NOT NULL,
    recipe_description TEXT NOT NULL
);

insert into recipes values (4651,'Tomato Mushroom Risotto', 'Creamy Italian style risotto with tomato & mushroom');

    

------------------------------------------------------------------------

CREATE TABLE recipe_steps(
    recipe_id INTEGER,
    step_number INTEGER,
    instructions TEXT NOT NULL,
    PRIMARY KEY (recipe_id, step_number),
    FOREIGN KEY (recipe_id) 
      REFERENCES recipes (recipe_id) 
         ON DELETE CASCADE 
         ON UPDATE NO ACTION
);


insert into recipe_steps values (4651, 1, 'In a large saucepan sauté the shallots with the olive oil for about 3 to 4 minutes.');

------------------------------------------------------------------------


CREATE TABLE ref_ingredient_types (
    ingredient_type_code INTEGER PRIMARY KEY AUTOINCREMENT,
    ingredient_type_description TEXT NOT NULL
);

insert into ref_ingredient_types values (1103,'Taste somewhat like a common onion with a milder flavor and release a sweetness when cooked properly.');
    

------------------------------------------------------------------------

CREATE TABLE ingredients(
    ingredient_id INTEGER,
    ingredient_type_code INTEGER,
    ingredient_name TEXT NOT NULL,
    PRIMARY KEY (ingredient_id),
    FOREIGN KEY (ingredient_type_code) 
      REFERENCES ref_ingredient_types (ingredient_type_code) 
         ON DELETE CASCADE 
         ON UPDATE NO ACTION
);


insert into ingredients values (53022, 0, "1% low-fat buttermilk");


------------------------------------------------------------------------

CREATE TABLE recipes_step_ingredients(
    recipe_id INTEGER,
    step_number INTEGER,
    ingredient_id INTEGER,
    amount_required TEXT NOT NULL,
    PRIMARY KEY (recipe_id, step_number, ingredient_id),
    FOREIGN KEY (recipe_id) 
      REFERENCES recipes_steps (recipe_id) 
         ON DELETE CASCADE 
         ON UPDATE NO ACTION,
    FOREIGN KEY (step_number) 
      REFERENCES recipes_steps (step_number) 
         ON DELETE CASCADE 
         ON UPDATE NO ACTION,
    FOREIGN KEY (ingredient_id) 
      REFERENCES ingredients (ingredient_id) 
         ON DELETE CASCADE 
         ON UPDATE NO ACTION
);


insert into recipes_step_ingredients values (4651, 1, 53022, '1 large');


------------------------------------------------------------------------



