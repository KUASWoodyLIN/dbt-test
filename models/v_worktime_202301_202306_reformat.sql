{{ config(materialized='table', schema='public', grants = {'select': 'read_user'}) }}

with 
    v_worktime as (
        select 
            agformno,
            wtdate,
            wid,
            username,
            agformstatus,
            jobname1,
            jobname2,
            CASE region 
                WHEN '系統產品研發事業群系統產品研發二處' THEN '系統產品研發事業群-系統產品研發二處'
                WHEN '系統產品研發事業群系統產品研發三處' THEN '系統產品研發事業群-系統產品研發三處'
                WHEN '創新技術研發事業群核心技術及IP設計處' THEN '創新技術研發事業群-核心技術及IP設計處'
                WHEN '系統產品研發事業群系統產品研發事業群-系統產品研發五處' THEN '系統產品研發事業群-系統產品研發五處'
                WHEN '創新技術研發事業群晶片驗證處' THEN '創新技術研發事業群-晶片驗證處'
                WHEN '創新技術研發事業群NAND FLASH 技術處' THEN '創新技術研發事業群-NAND FLASH 技術處'
                WHEN '系統產品研發事業群系統產品研發一處' THEN '系統產品研發事業群-系統產品研發一處'
                WHEN '創新技術研發事業群晶片實現處' THEN '創新技術研發事業群-晶片實現處'
                WHEN '系統產品研發事業群-' THEN '系統產品研發事業群'
                WHEN '創新技術研發事業群系統應用處' THEN '創新技術研發事業群-系統應用處'
                WHEN '系統產品研發事業群專案管理暨策略規劃處' THEN '系統產品研發事業群-專案管理暨策略規劃處'
                WHEN '系統產品研發事業群系統產品研發五處' THEN '系統產品研發事業群-系統產品研發五處'
                WHEN '系統產品研發事業群系統產品研發事業群' THEN '系統產品研發事業群-系統產品研發事業群'
                WHEN '創新技術研發事業群晶片設計處' THEN '創新技術研發事業群-晶片設計處'
                ELSE region
	        END as region,
            dept,
            unit,
            projectcat1,
            projectcat2,
            projectcat3,
            percentpermonth 
        from agentflow.public.v_worktime_202301_202306
    ),
    final as (
        select * from v_worktime
    )
select * from final



