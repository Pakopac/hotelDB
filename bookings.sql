SELECT
    `hotels`.`name` AS 'hotel_name',
    `bookings`.`start_date`,
    `bookings`.`end_date`,
    `rooms`.`number` AS 'room_number',
    `rooms`.`price_for_a_night`,
    `customers`.`firstname`,
    `customers`.`lastname`,
    `customers`.`phone_number` AS 'customer_phone_number'
FROM
    `bookings`
LEFT JOIN `rooms` ON `bookings`.`room_id` = `rooms`.`id`
LEFT JOIN `hotels` ON `rooms`.`hotel_id` = `hotels`.`id`
LEFT JOIN `customers` ON `bookings`.`customer_id` = `customers`.`id`
WHERE
    `bookings`.`start_date` LIKE '2017-12%'