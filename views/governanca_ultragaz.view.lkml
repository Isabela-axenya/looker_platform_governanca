# The name of this view in Looker is "Governanca Ultragaz"
view: governanca_ultragaz {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `governanca.governanca_ultragaz` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Afastados" in Explore.

  dimension: afastados {
    type: string
    sql: ${TABLE}.afastados ;;
  }

  dimension: area_de_atuacao {
    type: string
    sql: ${TABLE}.area_de_atuacao ;;
  }

  dimension: chave {
    type: string
    sql: ${TABLE}.chave ;;
  }

  dimension: client_id {
    type: string
    sql: ${TABLE}.client_id ;;
  }

  dimension: cod_empresa {
    type: string
    sql: ${TABLE}.cod_empresa ;;
  }

  dimension: cod_tuss {
    type: string
    sql: ${TABLE}.cod_tuss ;;
  }

  dimension: cod_usuario_servico {
    type: string
    sql: ${TABLE}.cod_usuario_servico ;;
  }

  dimension: cpf_beneficiario {
    hidden: yes
    type: string
    sql: ${TABLE}.cpf_beneficiario ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: data_atendto {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.data_atendto ;;
  }

  dimension_group: data_nascimento {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.data_nascimento ;;
  }

  dimension: descricao_operadora {
    type: string
    sql: ${TABLE}.descricao_operadora ;;
  }

  dimension: diretoria {
    type: string
    sql: ${TABLE}.diretoria ;;
  }

  dimension: elegivel {
    type: yesno
    sql: ${TABLE}.elegivel ;;
  }

  dimension: faixa_etaria {
    type: string
    sql: ${TABLE}.faixa_etaria ;;
  }

  dimension: filial {
    type: string
    sql: ${TABLE}.filial ;;
  }

  dimension: head_area {
    type: string
    sql: ${TABLE}.head_area ;;
  }

  dimension: idade {
    type: number
    sql: ${TABLE}.idade ;;
  }

  dimension: matricula {
    type: string
    sql: ${TABLE}.matricula ;;
  }

  dimension: mercado {
    type: string
    sql: ${TABLE}.mercado ;;
  }

  dimension_group: mes_competencia {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    datatype: datetime
    sql: ${TABLE}.mes_competencia ;;
  }

  dimension: mes_competencia_ord_desc {
    hidden: yes
    type: number
    sql: - (EXTRACT(YEAR FROM ${TABLE}.mes_competencia) * 10000
         + EXTRACT(MONTH FROM ${TABLE}.mes_competencia) * 100
         + EXTRACT(DAY FROM ${TABLE}.mes_competencia)) ;;
  }

  dimension: mes_competencia_mes_ano {
    type: string
    label: "Mês Competência"
    sql: FORMAT_DATE('%d/%m/%Y', ${TABLE}.mes_competencia) ;;
    order_by_field: mes_competencia_ord_desc
  }



  dimension: nome {
    hidden:  yes
    type: string
    sql: ${TABLE}.nome_beneficiario ;;
  }

  dimension: operadora {
    type: string
    sql: ${TABLE}.operadora ;;
  }

  dimension: participantes_programas {
    type: string
    sql: ${TABLE}.participantes_programas ;;
  }

  dimension: porta_entrada {
    type: string
    sql: ${TABLE}.porta_entrada ;;
  }

  dimension: premio {
    type: number
    sql: ${TABLE}.premio ;;
  }

  dimension: senha {
    type: string
    sql: ${TABLE}.senha ;;
  }

  dimension: sexo {
    type: string
    sql: ${TABLE}.sexo ;;
  }

  dimension: sinistro {
    type: number
    sql: ${TABLE}.sinistro ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: subestipulante {
    type: string
    sql: ${TABLE}.subestipulante ;;
  }

  dimension: telemedicina_com_ps {
    type: string
    sql: ${TABLE}.telemedicina_com_ps ;;
  }

  dimension: tipo_evento {
    type: string
    sql: ${TABLE}.tipo_evento ;;
  }

  dimension: titularidade {
    type: string
    sql: ${TABLE}.titularidade ;;
  }
  measure: count {
    type: count
  }

  ## Métricas cálculadas

  # Qtd consulta
  dimension: qtd_consulta {
    label: "Qtd consulta"
    sql:
      CASE
        WHEN ${tipo_evento} = 'CONSULTA' THEN ${nome}
      END ;;
  }

  # Qtd internação
  dimension: qtd_internacao {
    label: "Qtd internação"
    sql:
      CASE
        WHEN ${tipo_evento} = 'INTERNAÇÃO' THEN ${senha}
      END ;;
  }

  # Qtd Internação Eletiva
  dimension: qtd_internacao_eletiva {
    label: "Qtd Internação Eletiva"
    sql:
      CASE
        WHEN ${porta_entrada} = 'ELETIVA' THEN ${senha}
      END ;;
  }

  # Qtd Internação Emergencial
  dimension: qtd_internacao_emergencial {
    label: "Qtd Internação Emergencial"
    sql:
      CASE
        WHEN ${porta_entrada} = 'EMERGENCIAL' THEN ${senha}
      END ;;
  }

  # Qtd PS
  dimension: qtd_ps {
    label: "Qtd PS"
    sql:
      CASE
        WHEN ${tipo_evento} = 'PRONTO SOCORRO'
         AND ${descricao_operadora} NOT LIKE '%TAXA%'
        THEN ${nome}
      END ;;
  }

  # Qtd telemedicina + PS
  dimension: qtd_telemedicina_ps {
    label: "Qtd telemedicina + PS"
    sql:
      CASE
        WHEN ${telemedicina_com_ps} = 'Sim' THEN ${nome}
      END ;;
  }

  # Telemedicina
  dimension: telemedicina {
    label: "Telemedicina"
    sql:
      CASE
        WHEN ${cod_tuss} IN (
          '59998680','10014012','10014039','10014020','10014160','10014179',
          '59988630','10101063','61602540','66000882','66000904','66000912',
          '66000947','66000963','90101022'
        ) THEN ${nome}
      END ;;
  }

  # Valor PS
  dimension: valor_ps {
    label: "Valor PS"
    type: number
    sql:
      CASE
        WHEN ${tipo_evento} = 'PRONTO SOCORRO'
         AND ${tipo_evento} NOT LIKE '%CONSULTA%'
        THEN ${sinistro}
      END ;;
    value_format_name: "decimal_2"
  }

  # Valor Telemedicina
  dimension: valor_telemedicina {
    label: "Valor Telemedicina"
    type: number
    sql:
      CASE
        WHEN ${cod_tuss} IN (
          '59998680','10014012','10014039','10014020','10014160','10014179',
          '59988630','10101063','61602540','66000882','66000904','66000912',
          '66000947','66000963','90101022'
        ) THEN ${sinistro}
      END ;;
    value_format_name: "decimal_2"
  }

  # Elegíveis Ca Mama (regras)
  dimension: elegiveis_ca_mama_regras {
    label: "Elegíveis Ca Mama (regras)"
    type: yesno
    sql:
      CASE
        WHEN ${idade} >= 50 AND ${idade} <= 69
         AND ${sexo} = 'Feminino'
        THEN TRUE ELSE FALSE
      END ;;
  }

  dimension: elegiveis_ca_mama {
    label: "Elegíveis Ca Mama"
    sql:
      CASE
        WHEN ${elegiveis_ca_mama_regras} IS TRUE THEN ${nome}
      END ;;
  }

  dimension: ca_mama {
    label: "Ca Mama"
    type: yesno
    sql:
      CASE
        WHEN ${cod_tuss} IN ('40808033', '40808041', '40901114')
        THEN TRUE ELSE FALSE
      END ;;
  }

  dimension: ca_mama_completo {
    label: "Ca Mama completo"
    sql:
      CASE
        WHEN ${elegiveis_ca_mama_regras} IS TRUE AND ${ca_mama}
        THEN ${nome}
      END ;;
  }

  # Elegíveis Ca Próstata (regras)
  dimension: elegiveis_ca_prostata_regras {
    label: "Elegíveis Ca Próstata (regras)"
    type: yesno
    sql:
      CASE
        WHEN ${idade} >= 50 AND ${sexo} = 'Masculino'
        THEN TRUE ELSE FALSE
      END ;;
  }

  dimension: elegiveis_ca_prostata {
    label: "Elegíveis Ca Próstata"
    sql:
      CASE
        WHEN ${elegiveis_ca_prostata_regras} THEN ${nome}
      END ;;
  }

  dimension: ca_prostata {
    label: "Ca Próstata"
    type: yesno
    sql:
      CASE
        WHEN ${cod_tuss} IN ('40316130', '40316149', '41101464', '40901173', '40901335')
        THEN TRUE ELSE FALSE
      END ;;
  }

  dimension: ca_prostata_completo {
    label: "Ca Próstata completo"
    sql:
      CASE
        WHEN ${ca_prostata} IS TRUE AND ${elegiveis_ca_prostata_regras} IS TRUE
        THEN ${nome}
      END ;;
  }

  # Elegíveis Ca Útero (regras)
  dimension: elegiveis_ca_utero_regras {
    label: "Elegíveis Ca Útero (regras)"
    type: yesno
    sql:
      CASE
        WHEN ${idade} >= 25 AND ${idade} <= 64
         AND ${sexo} = 'Feminino'
        THEN TRUE ELSE FALSE
      END ;;
  }

  dimension: elegiveis_ca_utero {
    label: "Elegíveis Ca Útero"
    sql:
      CASE
        WHEN ${elegiveis_ca_utero_regras} IS TRUE THEN ${nome}
      END ;;
  }

  dimension: ca_utero {
    label: "Ca Útero"
    type: yesno
    sql:
      CASE
        WHEN ${cod_tuss} IN ('40601137', '40601323', '40601293', '40314154')
        THEN TRUE ELSE FALSE
      END ;;
  }

  dimension: ca_utero_completo {
    label: "Ca Útero completo"
    sql:
      CASE
        WHEN ${elegiveis_ca_utero_regras} IS TRUE AND ${ca_utero} IS TRUE
        THEN ${nome}
      END ;;
  }

  measure: elegiveis {
    label: "Elegíveis"
    sql: CASE WHEN ${elegivel} IS TRUE THEN ${nome} END ;;
  }

  measure: elegiveis_count {
    label: "Elegível Contagem"
    type: sum
    sql: CASE WHEN ${elegivel} IS TRUE THEN 1 END ;;
    value_format_name: "decimal_0"
  }

  dimension: participam_programas {
    label: "Participam programas"
    sql:
      CASE
        WHEN ${participantes_programas} = 'Sim'
        THEN ${nome}
      END ;;
  }


  measure: total_sinistro {
    label: "Total Sinistro"
    type: sum
    sql: ${sinistro} ;;
  }

  measure: total_premio {
    label: "Total Prêmio"
    type: sum
    sql: ${premio} ;;
  }

  measure: count_beneficiarios {
    label: "Qtd beneficiários (Nome distinto)"
    type: count_distinct
    sql: ${nome} ;;
  }

  measure: count_mes_competencia {
    label: "Qtd datas de sinistro distintas"
    type: count_distinct
    sql: ${TABLE}.mes_competencia ;;
  }

  measure: count_qtd_ps {
    label: "COUNT(Qtd PS)"
    type: count
    filters: [qtd_ps: "-NULL"]
  }

  measure: count_qtd_consulta {
    label: "COUNT(Qtd consulta)"
    type: count
    filters: [qtd_consulta: "-NULL"]
  }

  measure: count_qtd_internacao_distinct {
    label: "COUNT_DISTINCT(Qtd internação)"
    type: count_distinct
    sql: ${qtd_internacao} ;;
  }

  measure: count_qtd_internacao_eletiva_distinct {
    label: "COUNT_DISTINCT(Qtd Internação Eletiva)"
    type: count_distinct
    sql: ${qtd_internacao_eletiva} ;;
  }

  measure: count_qtd_internacao_emergencial_distinct {
    label: "COUNT_DISTINCT(Qtd Internação Emergencial)"
    type: count_distinct
    sql: ${qtd_internacao_emergencial} ;;
  }

  measure: count_qtd_tele_ps {
    label: "COUNT(Qtd telemedicina + PS)"
    type: count
    filters: [qtd_telemedicina_ps: "-NULL"]
  }

  measure: count_telemedicina {
    label: "COUNT(Telemedicina)"
    type: count
    filters: [telemedicina: "-NULL"]
  }

  measure: sum_valor_ps {
    label: "SUM(Valor PS)"
    type: sum
    sql: ${valor_ps} ;;
  }

  measure: sum_valor_telemedicina {
    label: "SUM(Valor Telemedicina)"
    type: sum
    sql: ${valor_telemedicina} ;;
  }

  measure: total_afastados {
    label: "Total Afastados"
    type: number
    sql: COUNT(DISTINCT CASE WHEN ${afastados} = 'Sim' THEN ${nome} END) ;;
    value_format_name: "decimal_0"
  }


  measure: custo_medio_ps {
    label: "Custo médio PS"
    type: number
    sql:
      COALESCE(
        ${sum_valor_ps} / NULLIF(${count_qtd_ps}, 0),
        0
      ) ;;
    value_format: "\"R$\"#,##0"
  }

  measure: custo_medio_telemedicina {
    label: "Custo médio telemedicina"
    type: number
    sql:
      COALESCE(
        ${sum_valor_telemedicina} / NULLIF(${count_telemedicina}, 0),
        0
      ) ;;
    value_format: "\"R$\"#,##0.00"
  }



  measure: uso_consultas_eletivas {
    label: "Uso consultas eletivas"
    type: number
    sql:
      COALESCE(
        ${count_qtd_consulta} / NULLIF(${count_beneficiarios}, 0),
        0
      ) ;;
    value_format_name: "decimal_1"
  }

  measure: uso_consulta_variacao {
    label: "Uso de consulta variação"
    type: number
    sql: ${uso_consultas_eletivas} - 0.33 ;;
    value_format_name: "percent_2"
  }

  measure: uso_ps {
    label: "Uso de PS"
    type: number
    sql:
      COALESCE(
        ${count_qtd_ps} / NULLIF(${count_beneficiarios}, 0),
        0
      ) ;;
    value_format_name: "decimal_2"
  }

  measure: uso_ps_variacao {
    label: "Uso de PS variação"
    type: number
    sql: ${uso_ps} - 0.1075 ;;
    value_format_name: "percent_2"
  }

  measure: uso_internacao {
    label: "Uso internação"
    type: number
    sql:
      COALESCE(
        ${count_qtd_internacao_distinct} / NULLIF(${count_beneficiarios}, 0),
        0
      ) ;;
    value_format_name: "percent_2"
  }

  measure: uso_internacao_variacao {
    label: "Uso internação variação"
    type: number
    sql: ${uso_internacao} - 0.025 ;;
    value_format_name: "percent_2"
  }


  measure: uso_internacao_eletiva {
    label: "Uso Internação Eletiva"
    type: number
    sql:
      COALESCE(
        ${count_qtd_internacao_eletiva_distinct}
        / NULLIF(${count_qtd_internacao_distinct}, 0),
        0
      ) ;;
    value_format_name: "percent_2"
  }

  measure: uso_internacao_emergencial {
    label: "Uso Internação Emergencial"
    type: number
    sql:
      COALESCE(
        ${count_qtd_internacao_emergencial_distinct}
        / NULLIF(${count_qtd_internacao_distinct}, 0),
        0
      ) ;;
    value_format_name: "percent_2"
  }

  measure: uso_telemedicina {
    label: "Uso telemedicina"
    type: number
    sql:
      COALESCE(
        ${count_telemedicina} / NULLIF(${count_qtd_consulta}, 0),
        0
      ) ;;
    value_format_name: "percent_2"
  }

  measure: ans_uso_consultas_eletivas_4 {
    label: "ANS - Uso de consultas eletivas (4)"
    type: number
    sql:
      COALESCE(
        (
          ${uso_consultas_eletivas}
          - (0.33334 * ${count_mes_competencia})
        )
        / NULLIF(0.33334 * ${count_mes_competencia}, 0),
        0
      ) ;;
    value_format_name: "percent_2"
  }

  measure: ans_uso_ps_1_29 {
    label: "ANS - Uso de PS (1,29)"
    type: number
    sql:
      COALESCE(
        (
          ${uso_ps}
          - (0.1075 * ${count_mes_competencia})
        )
        / NULLIF(0.1075 * ${count_mes_competencia}, 0),
        0
      ) ;;
    value_format_name: "percent_2"
  }

  measure: ans_uso_internacao_2_5 {
    label: "ANS - Uso internação (2,5%)"
    type: number
    sql:
      COALESCE(
        ${uso_internacao} - 0.025,
        0
      ) ;;
    value_format_name: "percent_2"
  }


  measure: benchmark_consulta_eletiva {
    label: "Benchmark consulta eletiva"
    type: number
    sql: 0 ;;
  }

  measure: benchmark_internacao {
    label: "Benchmark Internação"
    type: number
    sql: 0 ;;
  }

  measure: breakeven {
    label: "Breakeven"
    type: number
    sql: 0 ;;
  }


  measure: sinistralidade {
    label: "Sinistralidade"
    type: number
    sql:
      COALESCE(
        ${total_sinistro} / NULLIF(${total_premio}, 0),
        0
      ) ;;
    value_format_name: "decimal_2"
  }

  measure: sinistralidade_variacao {
    label: "Sinistralidade variação"
    type: number
    sql: ${sinistralidade} - 0.8 ;;
    value_format_name: "decimal_2"
  }

  measure: desvio_ponto_equilibrio_80 {
    label: "Desvio do ponto de equilíbrio (80%)"
    type: number
    sql:
      COALESCE(
        ${sinistralidade} - 0.8,
        0
      ) ;;
    value_format_name: "decimal_2"
  }

  measure: gasto_ps_tele_e_ps {
    label: "Gasto PS+tele e PS"
    type: number
    sql:
      (
        ${count_qtd_tele_ps} * (${custo_medio_ps} + ${custo_medio_telemedicina})
      )
      + (
        (${count_qtd_ps} - ${count_qtd_tele_ps}) * ${custo_medio_ps}
      ) ;;
    value_format: "\"R$\"#,##0"
  }

  measure: previsto_gasto_ps_tele_e_ps {
    label: "Previsto - gasto PS+tele e PS"
    type: number
    sql:
      (
        (${count_qtd_ps} * 0.88) * ${custo_medio_telemedicina}
      )
      + (
        (${count_qtd_ps} * 0.12) * (${custo_medio_ps} + ${custo_medio_telemedicina})
      ) ;;
    value_format: "\"R$\"#,##0"
  }

  measure: gasto_ps_tele_e_ps_K {
    label: "Gasto PS+tele e PS_K"
    type: number
    sql:ROUND(
      (
        ${count_qtd_tele_ps} * (${custo_medio_ps} + ${custo_medio_telemedicina})
      )
      + (
        (${count_qtd_ps} - ${count_qtd_tele_ps}) * ${custo_medio_ps}
      )) ;;
    value_format: "0,\"k\""
  }

  measure: previsto_gasto_ps_tele_e_ps_K {
    label: "Previsto - gasto PS+tele e PS_K"
    type: number
    sql:ROUND(
      (
        (${count_qtd_ps} * 0.88) * ${custo_medio_telemedicina}
      )
      + (
        (${count_qtd_ps} * 0.12) * (${custo_medio_ps} + ${custo_medio_telemedicina})
      )) ;;
    value_format: "0,\"k\""
  }


  measure: economia_prevista_uso_ps {
    label: "Economia prevista - Uso de PS"
    type: number
    sql:
      ${gasto_ps_tele_e_ps} - ${previsto_gasto_ps_tele_e_ps} ;;
    value_format: "\"R$\"#,##0"
  }

  measure: economia_sinistro {
    label: "Economia Sinistro"
    type: number
    sql:
      ${total_sinistro} - ${economia_prevista_uso_ps} ;;
    value_format: "\"R$\"#,##0"
  }

  measure: economia_sinistralidade_ps {
    label: "Economia sinistralidade PS"
    type: number
    sql:
      COALESCE(
        ${economia_sinistro} / NULLIF(${total_premio}, 0),
        0
      ) ;;
    value_format_name: "decimal_2"
  }

  measure: diferenca_ps_sem_tele {
    label: "Diferença PS sem tele"
    type: number
    sql:
      COALESCE(
        1 - (
          ${count_qtd_tele_ps} / NULLIF(${count_qtd_ps}, 0)
        ),
        0
      ) ;;
    value_format_name: "percent_2"
  }


  measure: exames_preventivos_ca_mama {
    label: "Exames Preventivos CA Mama"
    type: number
    sql:
      COALESCE(
        COUNT(DISTINCT ${ca_mama_completo})
        / NULLIF(COUNT(DISTINCT ${elegiveis_ca_mama}), 0),
        0
      ) ;;
    value_format_name: "percent_2"
  }

  measure: exames_preventivos_ca_prostata {
    label: "Exames Preventivos Ca Próstata"
    type: number
    sql:
      COALESCE(
        COUNT(DISTINCT ${ca_prostata_completo})
        / NULLIF(COUNT(DISTINCT ${elegiveis_ca_prostata}), 0),
        0
      ) ;;
    value_format_name: "percent_2"
  }

  measure: exames_preventivos_ca_utero {
    label: "Exames Preventivos Ca Útero"
    type: number
    sql:
      COALESCE(
        COUNT(DISTINCT ${ca_utero_completo})
        / NULLIF(COUNT(DISTINCT ${elegiveis_ca_utero}), 0),
        0
      ) ;;
    value_format_name: "percent_2"
  }

  measure: participantes {
    label: "Participantes"
    type: number
    sql:
    COALESCE(
      COUNT(DISTINCT ${participam_programas})
      / NULLIF(COUNT(DISTINCT ${elegiveis}), 0),
      0
    ) ;;
    value_format_name: "decimal_0"
  }


  measure: participantes_2 {
    label: "Participantes 2"
    type: number
    sql:
      CASE
        WHEN ${participantes} <= 1 THEN ${participantes}
        ELSE 1
      END ;;
    value_format_name: "decimal_2"
  }


  measure: premio_2 {
    label: "Prêmio_2"
    type: number
    sql:
      AVG(
        CASE
          WHEN ${nome} IS NOT NULL
           AND ${chave} IS NOT NULL
           AND ${TABLE}.mes_competencia IS NOT NULL
          THEN ${premio}
        END
      ) ;;
    value_format_name: "decimal_2"
  }
}
