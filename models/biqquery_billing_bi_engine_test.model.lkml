connection: "bigquery_billing"

# include all the views
include: "/views/**/*.view"

datagroup: biqquery_billing_bi_engine_test_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "0 seconds"
}

persist_with: biqquery_billing_bi_engine_test_default_datagroup

explore: jay_test {
  persist_for: "0 seconds"
  join: jay_test__labels {
    view_label: "Jay Test: Labels"
    sql: LEFT JOIN UNNEST(${jay_test.labels}) as jay_test__labels ;;
    relationship: one_to_many
  }

  join: jay_test__referenced_tables {
    view_label: "Jay Test: Referenced Tables"
    sql: LEFT JOIN UNNEST(${jay_test.referenced_tables}) as jay_test__referenced_tables ;;
    relationship: one_to_many
  }
}

explore: mw_billing_export {
  persist_for: "0 seconds"
  join: mw_billing_export__labels {
    view_label: "Mw Billing Export: Labels"
    sql: LEFT JOIN UNNEST(${mw_billing_export.labels}) as mw_billing_export__labels ;;
    relationship: one_to_many
  }

  join: mw_billing_export__credits {
    view_label: "Mw Billing Export: Credits"
    sql: LEFT JOIN UNNEST(${mw_billing_export.credits}) as mw_billing_export__credits ;;
    relationship: one_to_many
  }

  join: mw_billing_export__system_labels {
    view_label: "Mw Billing Export: System Labels"
    sql: LEFT JOIN UNNEST(${mw_billing_export.system_labels}) as mw_billing_export__system_labels ;;
    relationship: one_to_many
  }

  join: mw_billing_export__project__labels {
    view_label: "Mw Billing Export: Project Labels"
    sql: LEFT JOIN UNNEST(${mw_billing_export.project__labels}) as mw_billing_export__project__labels ;;
    relationship: one_to_many
  }
}

explore: mw_query_history {
  persist_for: "0 seconds"
  join: mw_query_history__labels {
    view_label: "Mw Query History: Labels"
    sql: LEFT JOIN UNNEST(${mw_query_history.labels}) as mw_query_history__labels ;;
    relationship: one_to_many
  }

  join: mw_query_history__referenced_tables {
    view_label: "Mw Query History: Referenced Tables"
    sql: LEFT JOIN UNNEST(${mw_query_history.referenced_tables}) as mw_query_history__referenced_tables ;;
    relationship: one_to_many
  }
}

explore: tony_chicago_crime {
  persist_for: "0 seconds"
}
