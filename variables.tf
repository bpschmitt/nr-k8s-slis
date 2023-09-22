variable "newrelic_account_id" {
    description = "New Relic Account ID"
    type = number
    default = 0
}

variable "newrelic_cluster_name" {
    description = "New Relic Cluster Name"
    type = string
    default = ""
}

variable "newrelic_cluster_entity_guid" {
    description = "Kubernetes Cluster Entity GUID"
    type = string
    default = ""
}

variable "k8s_component_slis" {
    description = "List of K8s Component SLIs to check"
    type = list(string)
    default = ["autoregister-completion",
                "etcd",
                "etcd-readiness",
                "informer-sync",
                "log",
                "ping",
                "poststarthook/aggregator-reload-proxy-client-cert",
                "poststarthook/apiservice-discovery-controller",
                "poststarthook/apiservice-openapi-controller",
                "poststarthook/apiservice-openapiv3-controller",
                "poststarthook/apiservice-registration-controller",
                "poststarthook/apiservice-status-available-controller",
                "poststarthook/bootstrap-controller",
                "poststarthook/crd-informer-synced",
                "poststarthook/generic-apiserver-start-informers",
                "poststarthook/kube-apiserver-autoregistration",
                "poststarthook/priority-and-fairness-config-consumer",
                "poststarthook/priority-and-fairness-config-producer",
                "poststarthook/priority-and-fairness-filter",
                "poststarthook/rbac/bootstrap-roles",
                "poststarthook/scheduling/bootstrap-system-priority-classes",
                "poststarthook/start-apiextensions-controllers",
                "poststarthook/start-apiextensions-informers",
                "poststarthook/start-cluster-authentication-info-controller",
                "poststarthook/start-deprecated-kube-apiserver-identity-lease-garbage-collector",
                "poststarthook/start-kube-aggregator-informers",
                "poststarthook/start-kube-apiserver-admission-initializer",
                "poststarthook/start-kube-apiserver-identity-lease-controller",
                "poststarthook/start-kube-apiserver-identity-lease-garbage-collector",
                "poststarthook/start-legacy-token-tracking-controller",
                "poststarthook/start-service-ip-repair-controllers",
                "poststarthook/start-system-namespaces-controller",
                "poststarthook/storage-object-count-tracker-hook",
                "shutdown"]
}