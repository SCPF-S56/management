locals {
  dept_files = fileset(path.module, "departments/*.json")
  
  departments = {
    for f in local.dept_files : 
    replace(basename(f), ".json", "") => jsondecode(file(f))
  }
}

module "departments" {
  source   = "./modules/department_template"
  for_each = local.departments

  department_name = replace(each.key, "_", "-")
  approvers       = each.value.approvers
  members         = each.value.members
}

output "debug_detected_files" {
  value = local.dept_files
}

