SELECT
    C.c_custkey,
    C.c_name,
    C.c_nationkey AS nation,
    SUM(
        o.o_totalprice
    ) AS total_order_price
FROM
    snowflake_sample_data.tpch_sf1.customer AS C
    LEFT JOIN snowflake_sample_data.tpch_sf1.orders AS o
    ON C.c_custkey = o.o_custkey
GROUP BY
    C.c_custkey,
    C.c_name,
    C.c_nationkey
HAVING
    SUM(
        o.o_totalprice
    ) > 0
