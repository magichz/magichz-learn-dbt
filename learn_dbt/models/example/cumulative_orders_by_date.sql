SELECT
    o_orderdate AS order_date,
    SUM(o_totalprice) AS total_sales
FROM
    snowflake_sample_data.tpch_sf1.orders
GROUP BY
    o_orderdate
