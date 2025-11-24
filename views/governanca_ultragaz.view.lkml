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

  dimension: nome_beneficiario {
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
}
