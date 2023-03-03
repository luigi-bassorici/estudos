-- Active: 1675368754161@@127.0.0.1@3306@olist

-- View orders filtrada, tendo apenas os pedidos de status 'delivered'

CREATE VIEW delivered_orders AS 
	 (
	    SELECT
	        order_id as ref_id,
	        customer_id,
	        order_purchase_timestamp,
	        order_approved_at,
	        order_delivered_carrier_date,
	        order_delivered_customer_date,
	        order_estimated_delivery_date
	    FROM orders
	    WHERE
	        order_status = 'delivered'
	);

