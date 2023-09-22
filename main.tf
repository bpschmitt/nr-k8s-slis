
resource "newrelic_service_level" "k8s_slis_ready" {
    guid = var.newrelic_cluster_entity_guid
    name = "Readiness SLO for Kubernetes Healthcheck: ${each.value}"
    description = "Readiness SLO for Kubernetes Healthcheck: ${each.value}"

    for_each = toset(var.k8s_component_slis)

    events {
        account_id = var.newrelic_account_id
        valid_events {
            from = "Metric"
            where = "metricName = 'kubernetes_healthcheck' and name = '${each.value}' and type = 'readyz' and cluster_name = '${var.newrelic_cluster_name}'"
        }
        good_events {
            from = "Metric"
            where = "metricName = 'kubernetes_healthcheck' and name = '${each.value}' and type = 'readyz' and cluster_name = '${var.newrelic_cluster_name}' and kubernetes_healthcheck[count] = 1"
        }
    }

    objective {
        target = 99.00
        time_window {
            rolling {
                count = 1
                unit = "DAY"
            }
        }
    }
}

resource "newrelic_service_level" "k8s_slis_live" {
    guid = var.newrelic_cluster_entity_guid
    name = "Liveness SLO for Kubernetes Healthcheck: ${each.value}"
    description = "Liveness SLO for Kubernetes Healthcheck: ${each.value}"

    for_each = toset(var.k8s_component_slis)

    events {
        account_id = var.newrelic_account_id
        valid_events {
            from = "Metric"
            where = "metricName = 'kubernetes_healthcheck' and name = '${each.value}' and type = 'livez' and cluster_name = '${var.newrelic_cluster_name}'"
        }
        good_events {
            from = "Metric"
            where = "metricName = 'kubernetes_healthcheck' and name = '${each.value}' and type = 'livez' and cluster_name = '${var.newrelic_cluster_name}' and kubernetes_healthcheck[count] = 1"
        }
    }

    objective {
        target = 99.00
        time_window {
            rolling {
                count = 1
                unit = "DAY"
            }
        }
    }
}

resource "newrelic_entity_tags" "k8s_slis_ready_tags" {
    for_each = newrelic_service_level.k8s_slis_ready
    guid = each.value.sli_guid

   tag {
        key = "sli-type"
        values = ["readiness"]
    }

}

resource "newrelic_entity_tags" "k8s_slis_live_tags" {
  for_each = newrelic_service_level.k8s_slis_live
    guid = each.value.sli_guid

   tag {
        key = "sli-type"
        values = ["liveness"]
    }

}