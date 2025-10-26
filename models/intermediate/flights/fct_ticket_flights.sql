{{
  config(
    materialized = 'view',
    )
}}

select
    tf.ticket_no, 
    tf.flight_id, 
    tf.fare_conditions, 
    tf.amount, 
    t.book_ref, 
    t.passenger_id, 
    t.passenger_name, 
    t.contact_data
from
    {{ ref('stg_flights_facts__ticket_flights') }} tf
    left join {{ ref('fct_tickets') }} t
    on tf.ticket_no = t.ticket_no 