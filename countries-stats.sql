SELECT
    `countries`.`name` AS  'country',
    COUNT(`bookings`.`id`) AS 'number_of_booking'
FROM
    `bookings`
LEFT JOIN `customers` ON `bookings`.`customer_id` = `customers`.`id`
LEFT JOIN `countries` ON `customers`.`country_id` = `countries`.`id`
GROUP BY `countries`.`name`