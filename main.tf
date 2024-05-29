provider "flux" {
  kubernetes = {
    config_path    = "~/.kube/config"
    config_context = "microk8s"
  }

  git = {
    url = "https://github.com/${var.github_org}/${var.github_repo_name}"
    http = {
      username = var.github_org
      password = var.github_token
    }
  }
}

provider "helm" {
  kubernetes {
    config_path    = "~/.kube/config"
    config_context = "microk8s"
  }
}

resource "flux_bootstrap_git" "this" {
  path = "clusters"
}

resource "helm_release" "tf_controller" {
  name       = "tf-controller"
  repository = "https://flux-iac.github.io/tofu-controller"
  chart      = "tf-controller"
  version    = "0.15.1"
  namespace  = flux_bootstrap_git.this.namespace
}
