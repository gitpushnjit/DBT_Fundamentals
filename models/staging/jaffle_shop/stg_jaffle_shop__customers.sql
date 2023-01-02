customers as (
    
    select 
    id as customer_id,    
    last_name as surname,    
    first_name as givenname,   
    first_name || ' ' || last_name as full_name
    from base_customers

),