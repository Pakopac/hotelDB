SELECT
    `hotels`.`Name`,
    `hotels`.`phone_number`,
    `rooms`.`number`,
    `rooms`.`number_of_beds`,
    `rooms`.`price_for_a_night`
FROM
    `hotels`
LEFT JOIN `rooms` ON `hotels`.`id` = `rooms`.`hotel_id`