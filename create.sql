CREATE TABLE restaurant
    (
        restaurant_id int
            PRIMARY KEY,
        restaurant_name varchar(15) NOT NULL,
        type varchar(15) NOT NULL,
        city varchar(15) NOT NULL
    );

CREATE TABLE dish
    (
        dish_no int
            PRIMARY KEY,
        dish_name varchar(25) NOT NULL,
        type ENUM ('ap', 'en', 'ds')
    );

CREATE TABLE menu_item
    (
        item_no int
            PRIMARY KEY,
        restaurant_no int
            REFERENCES restaurant (restaurant_id),
        dish_no int
            REFERENCES dish (dish_no),
        price dec(4, 2)
            CHECK ( price BETWEEN 5 AND 50 )
    );

CREATE TABLE food_order
    (
        order_no int
            PRIMARY KEY,
        item_no int
            REFERENCES menu_item (item_no),
        date date
            CHECK ( date >= '2024-01-01'),
        time time
    );
