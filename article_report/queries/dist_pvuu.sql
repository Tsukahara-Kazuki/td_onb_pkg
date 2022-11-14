SELECT
  TD_TIME_FORMAT(time, 'yyyy-MM-dd', 'JST') AS date ,
  TD_TIME_FORMAT(time,'EEEE','JST') AS dow ,
  COUNT(*) AS pv ,
  COUNT(DISTINCT ${key_id}) AS uu ,
  '${td.each.article_key}' AS article_key
FROM
  ${log_db}.${log_tbl}
WHERE
  td_host = '${td.each.target_host}' AND
  regexp_like(td_path,'${td.each.article_id}') AND
  TD_TIME_RANGE(time,
    '${td.each.start_date}',
    '${td.each.end_date}',
    'JST'
  ) 
GROUP BY 
  1,2