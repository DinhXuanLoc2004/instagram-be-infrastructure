group "default" {
    targets = [ "auth-service", "post-service" ]
}

variable "TARGET" {
    default = "final"
}

variable "TAG" {
    default = "dev"
}

variable "JAVA_VERSION" {
    default = 21

  validation {
    condition = JAVA_VERSION >= 17
    error_message = "JAVA_VERSION >= 17"
  }
}

variable "IMAGE_BASE" {
    default = "eclipse-temurin"
}

variable "RUNTIME_BUILD" {
    default = "jdk"
}

variable "RUNTIME_FINAL" {
    default = "jre"
}

target "args_configuration" {
    args = {
        IMAGE_BASE = IMAGE_BASE
        JAVA_VERSION = JAVA_VERSION
        RUNTIME_BUILD = RUNTIME_BUILD
        RUNTIME_FINAL = RUNTIME_FINAL
    }
}

target "auth-service" {
    inherits = [ "args_configuration" ]
    context = "../../auth-service"
    target = TARGET
    tags = [ "auth-service:${TAG}" ]
    labels = {
        "org.opencontainers.image.title" = "auth-service"
        "org.opencontainers.image.version" = TAG
        "org.opencontainers.image.description" = "auth service"
        "org.opencontainers.image.source" = "https://github.com/DinhXuanLoc2004/instagram-be-auth-service/tree/main"
        "org.opencontainers.image.authors" = "dinhxuanloc2004"
    }
}

target "post-service" {
    inherits = [ "args_configuration" ]
    context = "../../post-service"
    target = TARGET
    tags = [ "post-service:${TAG}" ]
    labels = {
        "org.opencontainers.image.title" = "post-service"
        "org.opencontainers.image.version" = TAG
        "org.opencontainers.image.description" = "post service"
        "org.opencontainers.image.source" = "https://github.com/DinhXuanLoc2004/instagram-be-post-service/tree/main"
        "org.opencontainers.image.authors" = "dinhxuanloc2004"
    }
}

target "config-server" {
    inherits = [ "args_configuration" ]
    context = "../../config-server"
    target = TARGET
    tags = [ "config-server:${TAG}" ]
    labels = {
        "org.opencontainers.image.title" = "config-server"
        "org.opencontainers.image.version" = TAG
        "org.opencontainers.image.description" = "config service"
        "org.opencontainers.image.source" = "https://github.com/DinhXuanLoc2004/instagram-be-config-server/tree/main"
        "org.opencontainers.image.authors" = "dinhxuanloc2004"
    }
}

target "discovery-service" {
    inherits = [ "args_configuration" ]
    context = "../../discovery-service"
    target = TARGET
    tags = [ "discovery-service:${TAG}" ]
    labels = {
        "org.opencontainers.image.title" = "discovery-service"
        "org.opencontainers.image.version" = TAG
        "org.opencontainers.image.description" = "discovery service"
        "org.opencontainers.image.source" = "https://github.com/DinhXuanLoc2004/instagram-be-discovery-service/tree/main"
        "org.opencontainers.image.authors" = "dinhxuanloc2004"
    }
}

target "gateway-server" {
    inherits = [ "args_configuration" ]
    context = "../../gateway-server"
    target = TARGET
    tags = [ "gateway-server:${TAG}" ]
    labels = {
        "org.opencontainers.image.title" = "gateway-server"
        "org.opencontainers.image.version" = TAG
        "org.opencontainers.image.description" = "gateway server"
        "org.opencontainers.image.source" = "https://github.com/DinhXuanLoc2004/instagram-be-gateway-server/tree/main"
        "org.opencontainers.image.authors" = "dinhxuanloc2004"
    }
}

target "monitor-service" {
    inherits = [ "args_configuration" ]
    context = "../../monitor-service"
    target = TARGET
    tags = [ "monitor-service:${TAG}" ]
    labels = {
        "org.opencontainers.image.title" = "monitor-service"
        "org.opencontainers.image.version" = TAG
        "org.opencontainers.image.description" = "monitor service"
        "org.opencontainers.image.source" = "https://github.com/DinhXuanLoc2004/instagram-be-monitor-service/tree/main"
        "org.opencontainers.image.authors" = "dinhxuanloc2004"
    }
}


