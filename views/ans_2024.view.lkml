view: ans_2024 {
  derived_table: {
    sql:
      SELECT
        ROUND(SUM(IF(Sub_Grupo_SIP_Suridata = 'Consulta', Frequencia, 0)), 2) / 2 AS fr_consulta,
        ROUND(SUM(IF(Sub_Grupo_SIP_Suridata = 'Pronto Socorro', Frequencia, 0)), 2) / 2 AS fr_ps,
        ROUND(SUM(IF(Sub_Grupo_SIP_Suridata = 'Internação', Frequencia, 0)), 2) / 2 AS fr_internacao
      FROM `axenya-metabase.ans_dataset.sip_table_2024`
      WHERE Sub_Grupo_SIP_Suridata IN ('Consulta', 'Pronto Socorro', 'Internação')
        AND Tamanho_Operadora = 'Grande'
        AND modalidade_operadora IN ('Cooperativa Medica', 'Seguradora')
    ;;
  }

  dimension: fr_consulta   { type: number sql: ${TABLE}.fr_consulta ;; }
  dimension: fr_ps         { type: number sql: ${TABLE}.fr_ps ;; }
  dimension: fr_internacao { type: number sql: ${TABLE}.fr_internacao ;; }
}
