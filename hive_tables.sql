#Query-1#
CREATE EXTERNAL TABLE IF NOT EXISTS dsptb1.of_fs_geolocation (
    geolocation_zip_code_prefix STRING,
    geolocation_lat STRING,
    geolocation_lng STRING,
    geolocation_city STRING,
    geolocation_state STRING
)
PARTITIONED BY (
    year INT,
    month INT,
    day INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = ",",
    "quoteChar" = "\"",
    "escapeChar" = "\\"
)
STORED AS TEXTFILE
LOCATION 's3://offline-feature-store-project/geolocation-dataset/'
TBLPROPERTIES (
    "skip.header.line.count" = "1"
);

#Query-2#

CREATE EXTERNAL TABLE IF NOT EXISTS dsptb1.of_fs_orders (
    order_id STRING,
    customer_id STRING,
    order_status STRING,
    order_purchase_timestamp STRING,
    order_approved_at STRING,
    order_delivered_carrier_date STRING,
    order_delivered_customer_date STRING,
    order_estimated_delivery_date STRING
)
PARTITIONED BY (
    year INT,
    month INT,
    day INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = ",",
    "quoteChar" = "\"",
    "escapeChar" = "\\"
)
STORED AS TEXTFILE
LOCATION 's3://offline-feature-store-project/orders-dataset/'
TBLPROPERTIES (
    "skip.header.line.count" = "1"
);

#Query 3#

CREATE EXTERNAL TABLE IF NOT EXISTS dsptb1.of_fs_customers (
    customer_id STRING,
    customer_unique_id STRING,
    customer_zip_code_prefix STRING,
    customer_city STRING,
    customer_state STRING
)
PARTITIONED BY (
    year INT,
    month INT,
    day INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = ",",
    "quoteChar" = "\"",
    "escapeChar" = "\\"
)
STORED AS TEXTFILE
LOCATION 's3://offline-feature-store-project/customer-dataset/'
TBLPROPERTIES (
    "skip.header.line.count" = "1"
);

#Query 4#

CREATE EXTERNAL TABLE IF NOT EXISTS dsptb1.of_fs_order_items (
    order_id STRING,
    order_item_id STRING,
    product_id STRING,
    seller_id STRING,
    shipping_limit_date STRING,
    price STRING,
    freight_value STRING
)
PARTITIONED BY (
    year INT,
    month INT,
    day INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = ",",
    "quoteChar" = "\"",
    "escapeChar" = "\\"
)
STORED AS TEXTFILE
LOCATION 's3://offline-feature-store-project/order-items-dataset'
TBLPROPERTIES (
    "skip.header.line.count" = "1"
);

#Query 5#

CREATE EXTERNAL TABLE IF NOT EXISTS dsptb1.of_fs_products (
    product_id STRING,
    product_category_name STRING,
    product_name_length STRING,
    product_description_length STRING,
    product_photos_qty STRING,
    product_weight_g STRING,
    product_length_cm STRING,
    product_height_cm STRING,
    product_width_cm STRING
)
PARTITIONED BY (
    year INT,
    month INT,
    day INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = ",",
    "quoteChar" = "\"",
    "escapeChar" = "\\"
)
STORED AS TEXTFILE
LOCATION 's3://offline-feature-store-project/products-dataset/'
TBLPROPERTIES (
    "skip.header.line.count" = "1"
);

#Query 6#

CREATE EXTERNAL TABLE IF NOT EXISTS dsptb1.of_fs_sellers (
    seller_id STRING,
    seller_zip_code_prefix STRING,
    seller_city STRING,
    seller_state STRING
)
PARTITIONED BY (
    year INT,
    month INT,
    day INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = ",",
    "quoteChar" = "\"",
    "escapeChar" = "\\"
)
STORED AS TEXTFILE
LOCATION 's3://offline-feature-store-project/sellers-dataset/'
TBLPROPERTIES (
    "skip.header.line.count" = "1"
);

#Query 7#

CREATE EXTERNAL TABLE IF NOT EXISTS dsptb1.of_fs_order_payments (
    order_id STRING,
    payment_sequential STRING,
    payment_type STRING,
    payment_installments STRING,
    payment_value DOUBLE
)
PARTITIONED BY (
    year INT,
    month INT,
    day INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = ",",
    "quoteChar" = "\"",
    "escapeChar" = "\\"
)
STORED AS TEXTFILE
LOCATION 's3://offline-feature-store-project/order-payments-dataset/'
TBLPROPERTIES (
    "skip.header.line.count" = "1"
);

#Query 8#

CREATE EXTERNAL TABLE IF NOT EXISTS dsptb1.of_fs_order_reviews(
    review_id STRING,
    order_id STRING,
    review_score STRING,
    review_comment_title STRING,
    review_comment_message STRING,
    review_creation_date STRING,
    review_answer_timestamp STRING
)
PARTITIONED BY (
    year INT,
    month INT,
    day INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = ",",
    "quoteChar" = "\"",
    "escapeChar" = "\\"
)
STORED AS TEXTFILE
LOCATION 's3://offline-feature-store-project/order-reviews-dataset/'
TBLPROPERTIES (
    "skip.header.line.count" = "1"
);

#Query 9#

CREATE EXTERNAL TABLE IF NOT EXISTS dsptb1.of_fs_product_category_translation(
    product_category_name STRING,
    product_category_name_english STRING
)
PARTITIONED BY (
    year INT,
    month INT,
    day INT
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
    "separatorChar" = ",",
    "quoteChar" = "\"",
    "escapeChar" = "\\"
)
STORED AS TEXTFILE
LOCATION 's3://offline-feature-store-project/product-category-translation-dataset/'
TBLPROPERTIES (
    "skip.header.line.count" = "1"
);

