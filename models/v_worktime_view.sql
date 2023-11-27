{{ config(schema='public', grants = {'select': 'read_user'}) }}

with 
    v_worktime_1 as (
        select 
            agformno,
            wtdate,
            wid,
            username,
            agformstatus,
            jobname1,
            jobname2,
            region,
            dept,
            unit,
            projectcat1,
            projectcat2,
            projectcat3,
            percentpermonth 
        from agentflow.public.v_worktime
    ), 
    v_worktime_2 as (
        select 
            agformno,
            wtdate,
            wid,
            username,
            agformstatus,
            jobname1,
            jobname2,
            region,
            dept,
            unit,
            projectcat1,
            projectcat2,
            projectcat3,
            percentpermonth 
        from agentflow.public.v_worktime_202301_202306_reformat
    ),
    final as (
        select    
            agformno,
            wtdate,
            wid,
            username,
            agformstatus,
            jobname1,
            jobname2,
            split_part(region, '-', 1) as region,
            split_part(region, '-', 2) as div,
            CASE
                WHEN dept LIKE '%群-%' THEN split_part(dept, '-', 2)
                ELSE dept
            END as dept,
            CASE
                WHEN unit LIKE '%群-%' THEN split_part(unit, '-', 2)
                ELSE unit
            END as unit,
            projectcat1,
            projectcat2,
            projectcat3,
            percentpermonth  
        from (
            select * from v_worktime_1
            union all
            select * from v_worktime_2
        ) as a
    )
select * from final
