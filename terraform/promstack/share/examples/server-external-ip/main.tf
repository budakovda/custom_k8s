module "service-export-ip" {
    name = basename(abspath(path.module))
    source  = "../../modules/service-external-ip"
    namespace = "monitoring"
    create_namespace = true
    value   = fileexists("values.yaml") ? file("values.yaml") : ""
}
