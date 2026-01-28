# Define the database connection to be used for this model.
connection: "forninho-elevado"

# include all the views
include: "/views/**/*.view.lkml"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: governanca_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: governanca_default_datagroup

explore: governanca_ultragaz {
  join: ans_2024 {
    type: left_outer
    relationship: one_to_one
    sql_on: 1=1 ;;
  }
}
