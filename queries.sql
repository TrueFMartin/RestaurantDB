# Find and print the restaurant name and city for all restaurants serving Salad.
SELECT restaurant_name, city
  FROM restaurant
           JOIN (SELECT restaurant_no
                   FROM dish
                            NATURAL JOIN menu_item
                  WHERE dish_name = 'Salad') AS result
           ON restaurant_id = result.restaurant_no;

# Find all menu items served by Asian restaurants, sorted by price. Output the dish name, restaurant name, city, and price.
SELECT dish_name, restaurant_name, city, menu_item.price
  FROM (SELECT restaurant_id AS restaurant_no, restaurant_name, city FROM restaurant WHERE type = 'Asian') AS result
           NATURAL JOIN menu_item
           NATURAL JOIN dish d;

# Find and print the total number of menu items and the average price of the menu items for each restaurant.
# Output the restaurant name, city, number of items, and average price.
SELECT restaurant.restaurant_name, restaurant.city, COUNT(*) AS num_items, AVG(price) AS avg_price
  FROM restaurant
           JOIN menu_item
           ON restaurant_id = restaurant_no
 GROUP BY restaurant.restaurant_name, restaurant.city;

# Find and print the total price of all orders placed for Eureka Pizza,
# assuming a 10% tax rate. Output the number of orders,
# the average base price of each order (without tax),
# the total base price of all orders (without tax),
# and total price (with tax) in the result.
# Note: There should be only 1 tuple in the result.
SELECT COUNT(*) AS num_orders, AVG(base_price) AS avg_price, SUM(base_price) AS sum_base, SUM(total_price) AS sum_total
  FROM (SELECT restaurant_name, price AS base_price, price * 1.10 AS total_price
          FROM restaurant
                   JOIN menu_item
                   ON restaurant_id = restaurant_no) AS result
 WHERE restaurant_name = 'Eureka Pizza';


# Find and print the total price of all orders placed in March, assuming a 10% tax rate.
# Output the number of orders, the average base price of each order (without tax),
# the total base price of all orders (without tax), and total price (with tax) in the result.
# Note: There should be only 1 tuple in the result.
SELECT COUNT(*) AS num_orders, AVG(base_price) AS avg_price, SUM(base_price) AS sum_base, SUM(total_price) AS sum_total
  FROM (SELECT date, price AS base_price, price * 1.10 AS total_price
          FROM menu_item
                   NATURAL JOIN food_order) AS result
 WHERE date >= '2024-03-01'
   AND date < '2024-04-01';
